require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |tests|
	tests.pattern = Dir.glob('spec/**/*_spec.rb')
	tests.rspec_opts = '--format documentation'
end

task :default => :spec