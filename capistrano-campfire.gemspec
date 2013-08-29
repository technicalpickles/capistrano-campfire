# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "capistrano/version"

Gem::Specification.new do |spec|
  spec.name          = "capistrano-campfire"
  spec.version       = Capistrano::Campfire::VERSION
  spec.authors       = ["Joshua Nichols"]
  spec.email         = "josh@technicalpickles.com"
  spec.date          = "2013-08-28"
  spec.summary       = %q{Post to Campfire from capistrano}
  spec.description   = "capistrano-tinder is a very simple library for making a Campfire room accessible from capistrano. All it does is provide said access, and nothing more, preferring to let other gems do that trickery."
  spec.homepage      = "http://github.com/technicalpickles/capistrano-campfire"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.extra_rdoc_files = ["LICENSE"]

  spec.add_dependency "capistrano"
  spec.add_dependency "tinder"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "capistrano-spec"
end
