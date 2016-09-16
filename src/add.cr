title = ARGV.join(" ")
filename = ARGV.join("_").underscore

slides_dir = "#{__DIR__}/../slides/"

last_slide = Dir["#{slides_dir}/*"]
  .map { |f| File.basename(f) }
  .map { |f| f.match(/^(\d+)/).try &.[0].to_i }
  .compact.max? || 0

next_slide = (last_slide + 10) - (last_slide % 10)

next_slide_filename = "#{"%03d" % next_slide}-#{filename}.md"

File.open("#{slides_dir}/#{next_slide_filename}", "w") do |file|
  file << "## #{title}\n\n"
end

puts "#{next_slide_filename} ... created"
