# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blacklight/iiif/version'

Gem::Specification.new do |spec|
  spec.name          = "blacklight-iiif"
  spec.version       = Blacklight::Iiif::VERSION
  spec.authors       = ["Chris Beer"]
  spec.email         = ["cabeer@stanford.edu"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "rails"
  spec.add_dependency "blacklight", ">= 5.10"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-rails", "~> 3.1"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "rspec-activemodel-mocks"
  spec.add_development_dependency "rspec-collection_matchers"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "poltergeist", ">= 1.5.0"
  spec.add_development_dependency "factory_girl", "~> 4.5"
  spec.add_development_dependency "engine_cart", "~> 0.6.0"
  spec.add_development_dependency "database_cleaner", "1.3.0"
  spec.add_development_dependency "jettywrapper"

end
