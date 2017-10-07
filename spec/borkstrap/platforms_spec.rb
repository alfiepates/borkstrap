require "spec_helper"

RSpec.describe "#{Borkstrap}::PLATFORMS" do
	subject { Borkstrap::PLATFORMS }

	it "looks up for macOS" do
		expect(subject.lookup("x84_64-darwin16")).to have_attributes(
			brew_url: a_string_including("Homebrew/install"))
	end

	it "looks up for Linux" do
		expect(subject.lookup("i686-linux")).to have_attributes(
			brew_url: a_string_including("Linuxbrew/install"))
	end
end
