require "ecr"
require "file_utils"

abstract class Slide
  def build
  end
end

class MarkupSlide < Slide
  def initialize(@content : String)
  end

  ECR.def_to_s "#{__DIR__}/_markup.html.ecr"
end

class MarkdownSlide < Slide
  def initialize(@file : String, @output_dir : String)
    @content = File.read(@file)
  end

  def build
    @content = @content.sub /^```playground(.*)^```/m do |str, match|
      base_slide_name = File.basename(@file, File.extname(@file))
      code_file_name = "snippet-#{base_slide_name}"
      File.write("#{@output_dir}/#{code_file_name}.cr", match[1].lstrip)
      "<iframe src='#{code_file_name}' class='stretch'></iframe>"
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
            MarkupSlide.new(File.read(file))
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
