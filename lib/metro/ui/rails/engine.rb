require 'rails'

module Metro
  module Ui
    module Rails
      class Engine < ::Rails::Engine
        initializer 'metro-ui-rails.setup', 
          :after => 'less-rails.after.load_config_initializers', 
          :group => :all do |app|
            app.config.less.paths << File.join(config.root, 'vendor', 'toolkit')
            app.config.assets.paths << File.join(config.root, 'vendor', 'fonts')
        end
      end
    end
  end
end
