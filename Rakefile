require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['tests/*_test.rb']
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "freshy_filter_chain"
    gemspec.summary = "'get a freshy' filter chain"
    gemspec.description = "Enhances Rails filter chains so they refresh should a superclass change impact a subclass"
    gemspec.email = "ryan.l.bell@gmail.com"
    gemspec.homepage = "http://github.com/kofno/freshy_filter_chain"
    gemspec.authors = ["Ryan L. Bell"]

    gemspec.add_development_dependency "shoulda", "= 2.10.2"
    gemspec.add_development_dependency "redgreen", "= 1.2.2"

    gemspec.add_dependency "actionpack", ">= 2.3.0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install with: gem install jeweler"
end
