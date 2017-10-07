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

	describe "--bork-HEAD" do
		it "sets :head to false if not supplied" do
			parser = described_class.new([])
			expect(parser.call).to include(bork_head: false)
		end

		it "sets :head to true if supplied" do
			parser = described_class.new(%w[--bork-HEAD])
			expect(parser.call).to include(bork_head: true)
		end

		it "can be overridden with --no-bork-HEAD" do
			parser = described_class.new(%w[--bork-HEAD --no-bork-HEAD])
			expect(parser.call).to include(bork_head: false)
		end

		it "can be reoverridden with --bork-HEAD" do
			parser = described_class.new(%w[--bork-HEAD --no-bork-HEAD --bork-HEAD])
			expect(parser.call).to include(bork_head: true)
		end
	end
end
