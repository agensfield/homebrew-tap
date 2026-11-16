# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.20/mektup_1.0.20_darwin_arm64.tar.gz"
      sha256 "8d35d4eae2cd02f8e6bb112bc7fb6fb55b1b87c3b1b73136d2cac8517238ac48"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.20/mektup_1.0.20_darwin_amd64.tar.gz"
      sha256 "e9a1b20b8eb38797b470793a30da8b8ac191ba0709035430724db27c06fe4a01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.20/mektup_1.0.20_linux_arm64.tar.gz"
      sha256 "3c4a47ab7238a7eb864d42d48bfe32bd731a2f3495b9bd296d75840c663d266e"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.20/mektup_1.0.20_linux_amd64.tar.gz"
      sha256 "658a3a67cd1f89d7dd81d47313f586f9beae8ceb303274888b0a5c269ef12b33"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.20"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
