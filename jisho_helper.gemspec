$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jisho_helper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jisho_helper"
  s.version     = JishoHelper::VERSION
  s.authors     = ["Rory Brookes"]
  s.email       = ["rorybrookes89@hotmail.com"]
  s.summary     = "An EtoJ language gem"
  s.description = "This gem takes an English word and returns with the translation, dictionary definition and example sentence."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
end
