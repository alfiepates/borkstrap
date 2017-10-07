old_verbose, $VERBOSE = $VERBOSE, nil
require "webmock/rspec"
$VERBOSE = old_verbose

require "spec_helper"
require 'tempfile'

RSpec.describe Borkstrap::BrewInstall do
	subject { described_class.new(install_script_url: "https://example.com") }

	describe "#install" do
		it "executes the script" do
			file = Tempfile.new(self.class.name)

		  stub_request(:get, "https://example.com").to_return(body: <<-RUBY)
				File.write(#{file.path.inspect}, "hello")
			RUBY

			subject.install
			expect(file.read).to eq "hello"
		end
	end
end
