require "spec_helper"

RSpec.describe "./borkstrap" do
	describe "--help" do
		it "outputs documentation" do
			expect(`./borkstrap --help`).to include "Usage:"
		end

		it "documents the --repo option" do
			expect(`./borkstrap --help`).to include "--repo"
		end
	end

	# Unimplemented Features
	it "installs bork"
	it "pulls a git respository if specified"
	it "executes bork on the git repository if specified"
end
