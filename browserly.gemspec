$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "browserly/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "browserly"
  s.version     = Browserly::VERSION
  s.authors     = ["Alexander Selivanov"]
  s.email       = ["selivandex@gmail.com"]
  s.homepage    = "http://github.com/softeamco/browserly"
  s.summary     = "Website screenshot for Ruby"
  s.description = "Website screenshot for Ruby uses Selenium with Chrome Driver"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.5"
  s.add_development_dependency "comandor", "~> 0.1.5"
  s.add_development_dependency "selenium-webdriver", "~> 3.141.0"
end
