$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tables-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tables-rails"
  s.version     = TablesRails::VERSION
  s.authors     = ["hiroshi kobayashi"]
  s.email       = ["koba.shipbuilding@gmail.com"]
  s.homepage    = ""
  s.summary     = "show Tables"
  s.description = "show Tables"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.14"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
