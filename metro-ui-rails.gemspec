# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metro/ui/rails/version'

Gem::Specification.new do |gem|
  gem.name          = "metro-ui-rails"
  gem.version       = Metro::Ui::Rails::VERSION
  gem.authors       = ["Vilius Luneckas"]
  gem.email         = ["vilius.luneckas@gmail.com"]
  gem.description   = %q{metro-ui-rails project integrates Metro-UI CSS toolkit for Rails 3.1 Asset Pipeline}
  gem.summary       = %q{Metro-UI CSS toolkit for Rails 3.1 Asset Pipeline}
  gem.homepage      = "https://github.com/viliusluneckas/metro-ui-rails"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'less-rails', '~> 2.2.3'
  gem.add_development_dependency 'rails', '>= 3.1'
end
