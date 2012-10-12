require 'rails'

module Metro
  module Ui
    module Rails
      class Engine < ::Rails::Engine
        initializer 'metro-ui-rails.setup', 
          :after => 'less-rails.after.load_config_initializers', 
          :group => :all do |app|
            app.config.less.paths << File.join(config.root, 'vendor', 'toolkit')
        end
      end
    end
  end
end
