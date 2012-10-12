module Metro
  module Ui
    module Rails
      require 'metro/ui/rails/engine' if defined?(Rails)
    end
  end
end

require 'less-rails'
require 'metro/ui/rails/metro' if defined?(Rails)
