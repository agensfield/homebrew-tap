# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.6/mektup_1.0.6_darwin_arm64.tar.gz"
      sha256 "ab679ad593802f6abdbb36cbe651c8c215869f7a22ba4126ce017a0bf4f15b70"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.6/mektup_1.0.6_darwin_amd64.tar.gz"
      sha256 "d20ace57f70133522f1b65a4159b845c6a02af1685317c450cab6a95a72ba225"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.6/mektup_1.0.6_linux_arm64.tar.gz"
      sha256 "132bebcfdbfc9e6bfbc0db8c55355b2e07c5d4f8ded56eebe7fc81795e901ef9"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.6/mektup_1.0.6_linux_amd64.tar.gz"
      sha256 "bf467049e438f879622ffe8f188d680e12583f73fe705ad35d49debce5564db4"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.6"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
