# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.0/mektup_1.0.0_darwin_arm64.tar.gz"
      sha256 "caf6796de93993a39c37d077f8c6f0732582a4d36e7e923330ecc242325e4384"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.0/mektup_1.0.0_darwin_amd64.tar.gz"
      sha256 "fd2ef8abbdd6f82652fa913aa2dd35fd41a927145119b03c59bc6759d3e16682"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.0/mektup_1.0.0_linux_arm64.tar.gz"
      sha256 "22d2cfffefd63c4b579dc83738510852f2a85ca306a0c36cce10b356b829afad"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.0/mektup_1.0.0_linux_amd64.tar.gz"
      sha256 "bfa5ba61e6929fdd1312f4428b5c09275b9e8e33c8b425a498ac26c06a04d4e7"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.0"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
