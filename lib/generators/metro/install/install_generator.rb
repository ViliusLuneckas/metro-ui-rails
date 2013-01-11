require 'rails/generators'

module Metro
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Metro-UI-CSS to Asset Pipeline"

      def add_assets
        if File.exist?('app/assets/javascripts/application.js')
          insert_into_file "app/assets/javascripts/application.js", "//= require metro-ui\n", :after => "jquery_ujs\n"
        else
          copy_file "application.js", "app/assets/javascripts/application.js"
        end

        if File.exist?('app/assets/stylesheets/application.css')
          content = File.read("app/assets/stylesheets/application.css")
          unless content.match(/require_tree\s+\.\s*$/)
            style_require_block = " *= require metro_ui_and_overrides\n"
            insert_into_file "app/assets/stylesheets/application.css", style_require_block, :after => "require_self\n"
          end
        else
          copy_file "application.css", "app/assets/stylesheets/application.css"
        end

      end

      def add_metro_ui
        copy_file "metro_ui_and_overrides.less", "app/assets/stylesheets/metro_ui_and_overrides.css.less"
      end

      def cleanup_legacy
        gsub_file("app/assets/stylesheets/application.css", %r|\s*\*=\s*metro-ui/modern\s*\n|, "")
      end
    end
  end
end

