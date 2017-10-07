require "spec_helper"

RSpec.describe Borkstrap::Host do
	subject { described_class.instance }

  it "is a singleton" do
  	expect(described_class).not_to respond_to :new
  	expect(described_class.instance).to be_a described_class
  end

  specify "#platform returns a platform" do
  	expect(subject.platform).to satisfy { |x| Borkstrap::PLATFORMS.value?(x) }
  end
end
