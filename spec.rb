require "rspec"

load File.join(__dir__, "borkstrap")
RSpec.describe Borkstrap::OptionParser do
	describe "--repo" do
		it "can be set to a GitHub short name" do
			parser = described_class.new(%w[--repo foo/bar])
			expect(parser.call).to include(repo: "https://github.com/foo/bar")
		end

		it "can be set to a full Git repo URL" do
			parser = described_class.new(%w[--repo https://git.alfiepates.me/alfie/borkstrap])
			expect(parser.call).to include(repo: "https://git.alfiepates.me/alfie/borkstrap")
		end
	end
end

RSpec.describe "./borkstrap" do
	describe "--help" do
		it "outputs documentation" do
			expect(`./borkstrap --help`).to include "Usage:"
		end

		it "documents the --repo option" do
			expect(`./borkstrap --help`).to include "--repo"
		end
	end
end