# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.9/mektup_1.0.9_darwin_arm64.tar.gz"
      sha256 "d59ebb11e8f38815f58f24cb97d2870fa6a978f23b03c8239bc3f7936c033705"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.9/mektup_1.0.9_darwin_amd64.tar.gz"
      sha256 "d17c624b2ff233fb6740b0c276858a6edf57a4efc9cacbbbe843652c9f983ebf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.9/mektup_1.0.9_linux_arm64.tar.gz"
      sha256 "a1f10e39c1f2f1fda607ae95c7347af7fd0c90624162503a605c55c8781cab0e"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.9/mektup_1.0.9_linux_amd64.tar.gz"
      sha256 "c45a6ac2f1260cb159ba448e60b9fd889df09185fca022f7cbc2cbb7463ad6e9"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.9"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
