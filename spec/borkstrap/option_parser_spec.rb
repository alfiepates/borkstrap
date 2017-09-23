require "spec_helper"

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
