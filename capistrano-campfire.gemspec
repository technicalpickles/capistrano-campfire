# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{capistrano-campfire}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Nichols"]
  s.date = %q{2011-10-03}
  s.description = %q{ capistrano-tinder is a very simple library for making a Campfire room accessible from capistrano. All it does is provide said access, and nothing more, preferring to let other gems do that trickery.  }
  s.email = %q{josh@technicalpickles.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "capistrano-campfire.gemspec",
    "capistrano-tinder.gemspec",
    "lib/capistrano-campfire.rb",
    "lib/capistrano/campfire.rb",
    "spec/capistrano-campfire_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/technicalpickles/capistrano-campfire}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Post to Campfire from capistrano}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<tinder>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<tinder>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<tinder>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

