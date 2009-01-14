# -*- ruby -*-
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
 
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "aptinstaller"
    s.summary = "TODO"
    s.email = "nick@smartlogicsolutions.com"
    s.homepage = "http://github.com/ngauthier/aptinstaller"
    s.description = "README.txt"
    s.authors = ["Nick Gauthier"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
 
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end
 
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'Jeweler'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
 
task :default => :jeweler
