$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "trix_editor_helper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "trix_editor_helper"
  s.version     = TrixEditorHelper::VERSION
  s.authors     = ["Josh Klina"]
  s.email       = ["joshua.klina@gmail.com"]
  s.homepage    = "http://joshklina.com"
  s.summary     = "Add Trix Editor assets and form helpers to a Rails install"
  s.description = "Trix Editor Helper is a package that install the assets for the Trix Editor and also adds a form helper to easily add Trix to your forms "
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "pry-rails"
end
