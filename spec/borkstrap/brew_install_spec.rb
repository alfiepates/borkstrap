old_verbose, $VERBOSE = $VERBOSE, nil
require "webmock/rspec"
$VERBOSE = old_verbose

require "spec_helper"

RSpec.describe Borkstrap::BrewInstall do
	describe "#install_script" do
		subject { described_class.new(install_script_url: "https://example.com") }

		before do
		  # YAU SET THE TAB WIDTH FOR ME <333
		  stub_request(:get, "https://example.com").to_return(body: "foo bar")
		end
	
		it "fetches the install script from GitHub" do
			expect(subject.install_script.read).to eq "foo bar"
		end
		it "does not re-fetch the install script"
	end
end
