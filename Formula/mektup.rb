# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.14/mektup_1.0.14_darwin_arm64.tar.gz"
      sha256 "ca26e98fc30d6977ea856b3bc3f5b778519a153c06a3e2f591a9c2b6375cba08"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.14/mektup_1.0.14_darwin_amd64.tar.gz"
      sha256 "aadb60e6adbf507a92fd4bf470275a044bc7c1648126cd050e6de17345b122b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.14/mektup_1.0.14_linux_arm64.tar.gz"
      sha256 "0e7cd50da8832829e864fa84915f66aebff771d597b5a57d9a55c5d69c9f0567"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.14/mektup_1.0.14_linux_amd64.tar.gz"
      sha256 "d4e8bc6c67a14887c2abb87511527e734f88681fac44238a1ea35dd8992122d2"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.14"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
