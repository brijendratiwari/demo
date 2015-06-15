# -*- encoding: utf-8 -*-
# stub: grape-swagger-rails 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "grape-swagger-rails"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alexander Logunov"]
  s.date = "2015-02-05"
  s.description = "Swagger UI as Rails Engine for grape-swagger gem"
  s.email = ["unlovedru@gmail.com"]
  s.homepage = "https://github.com/TinkerDev/grape-swagger-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.3"
  s.summary = "Swagger UI as Rails Engine for grape-swagger gem"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.2.12"])
      s.add_runtime_dependency(%q<grape-swagger>, [">= 0.7.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<git>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<grape>, [">= 0"])
      s.add_development_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_development_dependency(%q<sass-rails>, [">= 0"])
      s.add_development_dependency(%q<uglifier>, [">= 0"])
      s.add_development_dependency(%q<coffee-rails>, [">= 0"])
      s.add_development_dependency(%q<jquery-rails>, [">= 0"])
      s.add_development_dependency(%q<grape-swagger-ui>, [">= 0"])
      s.add_development_dependency(%q<sprockets>, [">= 0"])
      s.add_development_dependency(%q<rack-cors>, [">= 0"])
    else
      s.add_dependency(%q<railties>, [">= 3.2.12"])
      s.add_dependency(%q<grape-swagger>, [">= 0.7.2"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<git>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<grape>, [">= 0"])
      s.add_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_dependency(%q<sass-rails>, [">= 0"])
      s.add_dependency(%q<uglifier>, [">= 0"])
      s.add_dependency(%q<coffee-rails>, [">= 0"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<grape-swagger-ui>, [">= 0"])
      s.add_dependency(%q<sprockets>, [">= 0"])
      s.add_dependency(%q<rack-cors>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.2.12"])
    s.add_dependency(%q<grape-swagger>, [">= 0.7.2"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<git>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<grape>, [">= 0"])
    s.add_dependency(%q<selenium-webdriver>, [">= 0"])
    s.add_dependency(%q<sass-rails>, [">= 0"])
    s.add_dependency(%q<uglifier>, [">= 0"])
    s.add_dependency(%q<coffee-rails>, [">= 0"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<grape-swagger-ui>, [">= 0"])
    s.add_dependency(%q<sprockets>, [">= 0"])
    s.add_dependency(%q<rack-cors>, [">= 0"])
  end
end
