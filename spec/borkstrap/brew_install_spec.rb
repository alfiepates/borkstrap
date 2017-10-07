old_verbose, $VERBOSE = $VERBOSE, nil
require "webmock/rspec"
$VERBOSE = old_verbose

require "spec_helper"

RSpec.describe Borkstrap::BrewInstall do
	describe "#install_script" do
		subject { described_class.new(install_script_url: "https://example.com") }

		let!(:request_stub) do
		  stub_request(:get, "https://example.com").to_return(body: "foo bar")
		end

		it "fetches the install script from GitHub" do
			expect(File.read(subject.install_script)).to eq "foo bar"
		end

		it "does not re-fetch the install script" do
		  2.times { subject.install_script }
		  expect(request_stub).to have_been_requested.once
		end
	end
end
