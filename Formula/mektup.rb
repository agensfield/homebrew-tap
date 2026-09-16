# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.1/mektup_1.0.1_darwin_arm64.tar.gz"
      sha256 "43cbb611d3c71b74a5195a40fdaecc83b9e538715bab614eb1a663b4e743b1a2"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.1/mektup_1.0.1_darwin_amd64.tar.gz"
      sha256 "391a935e85cefa2475855a18eb31bfab471203eb2066e3b32ca52aa16e6e8650"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.1/mektup_1.0.1_linux_arm64.tar.gz"
      sha256 "698aa77070d0c2159444f303fb99060df451d848a4542fbcabd6a4ba52219118"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.1/mektup_1.0.1_linux_amd64.tar.gz"
      sha256 "c2a359bb42ebc9495bab06d0deeef8242e9f2dbbf05d02b094b86a94ba0fc177"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.1"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
