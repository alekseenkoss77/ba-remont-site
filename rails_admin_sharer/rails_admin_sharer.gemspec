$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_sharer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_sharer"
  s.version     = RailsAdminSharer::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsAdminSharer."
  s.description = "TODO: Description of RailsAdminSharer."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
end