# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.10/mektup_1.0.10_darwin_arm64.tar.gz"
      sha256 "70abe6c9dee77308f420bdd95f6d39d93f848489544d10c74d72c5736196ed0e"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.10/mektup_1.0.10_darwin_amd64.tar.gz"
      sha256 "c329f17e0df792a6a3e1c9a2702541bd335f1a0e9677db5ef63f042aebd2f7e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.10/mektup_1.0.10_linux_arm64.tar.gz"
      sha256 "00727e57a5aa3bd5cf92c9e86a9ea374a9088d6df68442f56bf3cf7753f6477b"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.10/mektup_1.0.10_linux_amd64.tar.gz"
      sha256 "4564d1b8a65245088935518f389380e186326e78931245bdef9f957da7ab3d58"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.10"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
