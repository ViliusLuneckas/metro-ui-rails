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

desc "Copy stylesheets from submodule" 
task :stylesheets do
  images_path = 'vendor/assets/images/metro-ui/'
  FileUtils.mkdir_p 'vendor/toolkit/metro-ui/'
  FileUtils.mkdir_p images_path 

  Dir.glob("Metro-UI-CSS/less/*.less").each do |path|
    less = File.read(path)

    # quick fix for image paths
    less.gsub! /url\(..\/images\/([-_.a-zA-Z0-9]+)\)/, "image-url('metro-ui/\\1')"

    if image = $1
      # copy only required images
      FileUtils.cp "Metro-UI-CSS/public/images/#{image}", images_path
    end

    basename = Pathname.new(path).basename
    destination_file = "vendor/toolkit/metro-ui/#{basename}"
    
    File.write(destination_file, less)
  end
end

desc "Copy javascripts from submodule"
task :javascripts do
  path = 'vendor/assets/javascripts/metro-ui'
  FileUtils.mkdir_p path
  js_files = Dir.glob("Metro-UI-CSS/javascript/*.js")
  FileUtils.cp js_files, path

  File.open('vendor/assets/javascripts/metro-ui.js', 'w') do |output|
    js_files.each do |f|
      js_file = Pathname.new(f).basename.to_s.gsub('.js', '')
      output.write "//= require metro-ui/#{js_file}\n"
    end
  end
end

desc "Clean and then generate everything (default)"
task :assets => [:clean, :stylesheets, :javascripts]

task :default => :assets

