# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{autolang}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Blackburn", "Michael Grosser"]
  s.date = %q{2011-03-19}
  s.email = %q{michael@grosser.it}
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "Rakefile",
    "Readme.md",
    "VERSION",
    "autolang.gemspec",
    "lib/autolang.rb",
    "lib/tasks/autolang.rake",
    "spec/autolang_spec.rb"
  ]
  s.homepage = %q{http://github.com/grosser/autolang}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Kick-start new translation via google translate}
  s.test_files = [
    "spec/autolang_spec.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_runtime_dependency(%q<sishen-rtranslate>, [">= 0"])
    else
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<sishen-rtranslate>, [">= 0"])
    end
  else
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<sishen-rtranslate>, [">= 0"])
  end
end

