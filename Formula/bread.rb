# typed: false
# frozen_string_literal: true

class Bread < Formula
  desc "Bounded batch file reader for coding agents"
  homepage "https://github.com/HuakunShen/bread"
  version "0.2.4"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.4/bread_0.2.4_darwin_arm64.tar.gz"
      sha256 "b0a34a1021dc4f98caa44f6554122a4ddb7db3232a35769750c9b9d9a4578a47"
    elsif Hardware::CPU.intel?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.4/bread_0.2.4_darwin_amd64.tar.gz"
      sha256 "1bffa4a1e30687fa64a4541023aa582d6e91ab461513c8ee1992e5bd7b549083"
    else
      raise "Unsupported macOS architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.4/bread_0.2.4_linux_arm64.tar.gz"
      sha256 "77d467cfcb61d7182d8077414383b7e11a771cad7ec287ccb963c07d699cd0d1"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.4/bread_0.2.4_linux_amd64.tar.gz"
      sha256 "d945689f7c5f4ee013039c38167a5cdc399ba42902f3cdf84c00ed8264a45b7b"
    else
      raise "Unsupported Linux architecture"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install "bread"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bread --version")
  end
end
