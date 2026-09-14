# typed: false
# frozen_string_literal: true

class Bread < Formula
  desc "Bounded batch file reader for coding agents"
  homepage "https://github.com/HuakunShen/bread"
  version "0.2.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.2/bread_0.2.2_darwin_arm64.tar.gz"
      sha256 "fa95e00a2a3596464b61a17c6b622b15327f2bd0d361f384718bf7f6c655604c"
    elsif Hardware::CPU.intel?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.2/bread_0.2.2_darwin_amd64.tar.gz"
      sha256 "be0b5f32a46920985ed4f7a9d5bf886f3d4ebecc922869962594daa8753544a6"
    else
      raise "Unsupported macOS architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.2/bread_0.2.2_linux_arm64.tar.gz"
      sha256 "8ff09f4e0537729aaa5711bd4a9d1ae56bc99a1da9e9741fddaacde57ee94b94"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.2/bread_0.2.2_linux_amd64.tar.gz"
      sha256 "3ce4737bf685099043a3d840709f78bb6ca9155ca567241a02572d3c18105b23"
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
