require 'rails/generators'

module Metro
  module Generators
    class LayoutGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates layout file with navigation."
      argument :layout_name, :type => :string, :default => "application"

      attr_reader :app_name

      def generate_layout
        app = ::Rails.application
        @app_name = app.class.to_s.split("::").first
        template "layout.html.erb", "app/views/layouts/#{layout_name}.html.erb"
      end
    end
  end
end
