require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "imposter"
    gem.summary = "Real fake data"
    gem.description = "Create rails based schema level fake data."
    gem.email = "robert.hall@itatc.com"
    gem.homepage = "http://imposter.itatc.com"
    gem.authors = ["Robert Hall"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.add_dependency "sqlite3-ruby", ">= 1.2.5"
    gem.add_dependency "faker", ">= 0"
    gem.add_dependency "fastercsv", ">= 0"
    gem.files.include %w(lib/imposter/*.rb lib/imposter/*.db generators/**/*.rb)

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "imposter #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
