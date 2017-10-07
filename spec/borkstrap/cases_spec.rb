require "spec_helper"

RSpec.describe Borkstrap::Cases do
	let(:values) { Array.new(2) { double } }

	subject do
		described_class.new([
			Borkstrap::Cases::Entry.new(-> x { x.length == 3 }, values[0]),
			Borkstrap::Cases::Entry.new(/^f/,                   values[1]),
		])
	end

	it "returns the first matching entry" do
		expect(subject.lookup("foo")).to eq values[0]
		expect(subject.lookup("f")).to eq values[1]
	end

	it "raises an error when looking up an unknown entry" do
		expect { subject.lookup("") }.to raise_error KeyError
	end
end
