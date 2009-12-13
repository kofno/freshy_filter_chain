# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{freshy_filter_chain}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan L. Bell"]
  s.date = %q{2009-12-13}
  s.description = %q{Enhances Rails filter chains so they refresh should a superclass change impact a subclass}
  s.email = %q{ryan.l.bell@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "init.rb",
     "lib/freshy_filter_chain.rb",
     "tests/append_after_test.rb",
     "tests/append_around_test.rb",
     "tests/append_before_test.rb",
     "tests/deep_class_hierarchy_test.rb",
     "tests/normal_filter_chain_test.rb",
     "tests/prepend_after_test.rb",
     "tests/prepend_around_test.rb",
     "tests/prepend_before_test.rb",
     "tests/skip_after_test.rb",
     "tests/skip_before_test.rb",
     "tests/skip_test.rb",
     "tests/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/kofno/freshy_filter_chain}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{'get a freshy' filter chain}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, ["= 2.10.2"])
      s.add_development_dependency(%q<redgreen>, ["= 1.2.2"])
      s.add_runtime_dependency(%q<actionpack>, [">= 2.3.0"])
    else
      s.add_dependency(%q<shoulda>, ["= 2.10.2"])
      s.add_dependency(%q<redgreen>, ["= 1.2.2"])
      s.add_dependency(%q<actionpack>, [">= 2.3.0"])
    end
  else
    s.add_dependency(%q<shoulda>, ["= 2.10.2"])
    s.add_dependency(%q<redgreen>, ["= 1.2.2"])
    s.add_dependency(%q<actionpack>, [">= 2.3.0"])
  end
end

