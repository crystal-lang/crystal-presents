require "ecr"
require "file_utils"
require "yaml"

abstract class Slide
  def initialize(@file : String, @output_dir : String)
    @content = File.read(@file)
    @frontmatter = YAML::Any.new(nil)
  end

  def build
    if @content.starts_with?("---") && (m = @content.match(/^---\s*$/m, 1))
      @frontmatter = YAML.parse(m.pre_match)
      @content = m.post_match.lstrip
    end
  end

  def data
    String::Builder.build do |io|
      if (val = (@frontmatter.raw.as?(Hash).try &.["transition"]?))
        io << " data-transition=\"#{val}\" "
      end
    end
  end
end

class MarkupSlide < Slide
  ECR.def_to_s "#{__DIR__}/_markup.html.ecr"
end

class MarkdownSlide < Slide
  def build
    super

    if ARGV[0]? == "--no-playground"
      @content = @content.gsub("```playground", "```ruby")
    else
      @content = @content.sub /^```playground(.*)^```/m do |str, match|
        base_slide_name = File.basename(@file, File.extname(@file))
        code_file_name = "snippet-#{base_slide_name}"
        File.write("#{@output_dir}/#{code_file_name}.cr", match[1].lstrip)
        "<iframe src='#{code_file_name}' class='stretch'></iframe>"
      end
    end
  end

  ECR.def_to_s "#{__DIR__}/_markdown.html.ecr"
end

class Presentation
  getter slides = [] of Slide

  ECR.def_to_s "#{__DIR__}/slides.html.ecr"
end

slides_dir = "#{__DIR__}/../slides/"
output_dir = "#{__DIR__}/../playground/"

Dir["#{output_dir}/snippet-*.cr"].each do |file|
  FileUtils.rm_r(file)
end

p = Presentation.new

Dir["#{slides_dir}/*"].each do |file|
  slide = case File.extname(file)
          when ".html"
            MarkupSlide.new(file, output_dir)
          when ".md"
            MarkdownSlide.new(file, output_dir)
          else
            puts "ignoring: #{file}" unless file.ends_with?(".gitkeep")
            nil
          end
  if slide
    slide.build
    p.slides << slide
  end
end

print "Slides build: "

File.open("#{output_dir}/slides.html", "w") do |file|
  p.to_s(file)
end

puts "ok (#{Time.now})"
