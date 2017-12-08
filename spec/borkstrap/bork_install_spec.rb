require "spec_helper"

RSpec.describe Borkstrap::BorkInstall do
	it "initializes with :head" do
		expect(described_class.new(head: true)).to be_head
	end

	it "defaults :head to false" do
		expect(subject).not_to be_head
	end

	it { is_expected.to respond_to :install }
end
