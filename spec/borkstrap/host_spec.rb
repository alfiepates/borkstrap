require "spec_helper"

RSpec.describe Borkstrap::Host do
	specify ".current returns information for the current host" do
		expect(described_class.current).to be_a described_class
	end

	context "when running on macOS" do
		subject { described_class.new(os: :mac) }
 
		it { is_expected.to be_mac }
		it { is_expected.not_to be_linux }
	end

	context "when running on Linux" do
		subject { described_class.new(os: :linux) }
 
		it { is_expected.not_to be_mac }
		it { is_expected.to be_linux }
	end
end
