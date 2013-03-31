require "bundler/gem_tasks"
require "pathname"
require "fileutils"

task :submodule do
  sh "git submodule update --init" unless File.exist?('Metro-UI-CSS/README.md')
end

desc "Remove the vendor directory"
task :clean do
  FileUtils.rm_rf 'vendor'
end

desc "Copy stylesheets files from submodule" 
task :stylesheets do
  images_path = 'vendor/assets/images/metro-ui/'
  FileUtils.mkdir_p 'vendor/toolkit/metro-ui/'
  FileUtils.mkdir_p images_path 

  Dir.glob("Metro-UI-CSS/less/*.less").each do |path|
    less = File.read(path)

    regexp = /url\(..\/images\/([-_.a-zA-Z0-9]+)\)/

    # copy only required images
    less.scan(regexp).each do |images|
      FileUtils.cp "Metro-UI-CSS/public/images/#{images.first}", images_path
    end

    # fix for image paths
    less.gsub! regexp, "image-url('metro-ui/\\1')"


    # fix for font paths
    font_path_regexp = /@IconFontPath:\s*\".*\"/
    font_url_helper_regexp = /url\('@{IconFontPath}/
    less.gsub! font_path_regexp, "@IconFontPath: \"metro-ui\""
    less.gsub! font_url_helper_regexp, "font-url('@{IconFontPath}"

    basename = Pathname.new(path).basename
    destination_file = "vendor/toolkit/metro-ui/#{basename}"
    
    File.write(destination_file, less)
  end
end

desc "Copy javascripts files from submodule"
task :javascripts do
  path = 'vendor/assets/javascripts/metro-ui'
  FileUtils.mkdir_p path
  js_files = Dir.glob("Metro-UI-CSS/javascript/*.js")
  FileUtils.cp js_files, path
  FileUtils.cp 'Metro-UI-CSS/public/js/assets/jquery.mousewheel.min.js', 'vendor/assets/javascripts'
  File.open('vendor/assets/javascripts/metro-ui.js', 'w') do |output|
    output.write "//= require jquery.mousewheel.min.js\n"
    js_files.each do |f|
      js_file = Pathname.new(f).basename.to_s.gsub('.js', '')
      output.write "//= require metro-ui/#{js_file}\n"
    end
  end
end

desc "Copy font files from submodule"
task :fonts do
  path = 'vendor/assets/fonts/metro-ui'
  FileUtils.mkdir_p path
  image_types = %w(eot svg ttf woff)
  font_files = Dir.glob("Metro-UI-CSS/fonts/*.{#{image_types.join(',')}}")
  FileUtils.cp font_files, path
end

desc "Clean and then generate everything (default)"
task :assets => [:clean, :stylesheets, :javascripts, :fonts]

task :default => :assets

