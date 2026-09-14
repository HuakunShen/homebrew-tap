# typed: false
# frozen_string_literal: true

class Bread < Formula
  desc "Bounded batch file reader for coding agents"
  homepage "https://github.com/HuakunShen/bread"
  version "0.2.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.3/bread_0.2.3_darwin_arm64.tar.gz"
      sha256 "c4d2fb055583542e9f09174fd7b9686183fac0a7cab373cdaec6bc6678a07f6b"
    elsif Hardware::CPU.intel?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.3/bread_0.2.3_darwin_amd64.tar.gz"
      sha256 "6e91ce48cadfe6f6bddd4de5bda5f93f862c09e4699a2ee70dde030e6baf54bd"
    else
      raise "Unsupported macOS architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.3/bread_0.2.3_linux_arm64.tar.gz"
      sha256 "d942b8044bfa55a37ec71e63f12fe7e926b7a44db1d771f9d4a9d710f722e423"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/HuakunShen/bread/releases/download/v0.2.3/bread_0.2.3_linux_amd64.tar.gz"
      sha256 "2995f716a755afe4612283596793143c8f1ec74d2c5bfc8319a034498dc2894c"
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
