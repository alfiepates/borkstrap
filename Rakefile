require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |tests|
	tests.pattern = Dir.glob('spec/**/*_spec.rb')
	tests.rspec_opts = '--format documentation'
end

namespace :docker do
	task :clean do
		sh "docker image rm borkstrap"
	end

	task :build do
		sh "docker build -t borkstrap ."
	end

	task :run do
		sh "docker run --rm -it borkstrap /home/borkstrap/borkstrap"
	end
end

task :docker => ["docker:build", "docker:run"]

task :default => :spec
