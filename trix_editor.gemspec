$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "trix_editor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "trix_editor"
  s.version     = TrixEditor::VERSION
  s.authors     = ["Josh Klina"]
  s.email       = ["joshua.klina@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TrixEditor."
  s.description = "TODO: Description of TrixEditor."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "pry-rails"
end
