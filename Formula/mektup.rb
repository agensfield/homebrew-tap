# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.16/mektup_1.0.16_darwin_arm64.tar.gz"
      sha256 "59c8b163c0cfc1f395383df8c4b818c7d0920180e2cbb23c1c1d54817c35fa95"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.16/mektup_1.0.16_darwin_amd64.tar.gz"
      sha256 "032f89159b27f3ad2cbf72d73e773a0db08112a53909c3f87ab2f2e3731ef919"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.16/mektup_1.0.16_linux_arm64.tar.gz"
      sha256 "c9f7eb55046e33de1fbb128fd53e79803c5a31c5d4f97a456e2e82312b26804d"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.16/mektup_1.0.16_linux_amd64.tar.gz"
      sha256 "c6ddc1da419a7e82de416cd86e887deaf470e8c5e5ca07d77978614a19b6b0bd"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.16"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
