require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "colorblind"
  gem.summary = %Q{Colorblind extends ActiveSupport logger with trendy colorschemes from the 90's!}
  gem.description = %Q{Colorblind extends ActiveSupport logger with trendy colorschemes from the 90's!}
  gem.email = "info@codegram.com"
  gem.homepage = "http://github.com/codegram/colorblind"
  gem.authors = ["Oriol Gual", "Josep M. Bach", "Josep Jaume Rey"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency "activesupport", ">= 3.0.0"

  gem.add_development_dependency "rspec", ">= 2.0.0.beta.22"
  gem.add_development_dependency "bundler", "~> 1.0.0"
  gem.add_development_dependency "jeweler", "~> 1.5.0.pre3"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec
