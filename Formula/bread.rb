# typed: false
# frozen_string_literal: true

class Bread < Formula
  desc "Bounded batch file reader for coding agents"
  homepage "https://github.com/HuakunShen/bread"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.1/bread_0.2.1_darwin_arm64.tar.gz"
      sha256 "5a64a1b090a2b6b1f179b812767f675a7a10eaf582ffa3ab768acc1c5973f43e"
    else
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.1/bread_0.2.1_darwin_amd64.tar.gz"
      sha256 "dff885eada31aacb746d6efed86e2bb6859697b1544504194a8569d538a9a469"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.1/bread_0.2.1_linux_arm64.tar.gz"
      sha256 "aa1620e91154f2e5b666770d8db732ed80f71f467e0171ec1e0a8e17479270b0"
    else
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.1/bread_0.2.1_linux_amd64.tar.gz"
      sha256 "9deab2671fe8fb5168a8e03324713ec975b0036a1e264873e2455dabff3ba34b"
    end
  end

  def install
    bin.install "bread"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bread --version")
  end
end
