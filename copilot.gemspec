$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "copilot/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "copilot"
  s.version     = Copilot::VERSION
  s.authors     = ["Dave"]
  s.email       = ["dshvazz@gmail.com"]
  s.homepage    = "http://www.launchpadlab.com"
  s.summary     = "Summary of Copilot."
  s.description = "Description of Copilot."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "bcrypt", "~> 3.1.7"
  s.add_dependency "sass-rails", "~> 5.0"
  s.add_dependency "paperclip", "~> 4.2"

  s.add_development_dependency "sqlite3"
  # s.add_development_dependency "jquery-rails"

end
