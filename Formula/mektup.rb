# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.8/mektup_1.0.8_darwin_arm64.tar.gz"
      sha256 "751b8c8e4dfcc823b67056e9ddc8871ce177997fe41cd080228c7d5707bb421a"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.8/mektup_1.0.8_darwin_amd64.tar.gz"
      sha256 "d97b2b9388e1b2f0dc8a0fc1291045392d377e49eafd365c87d38904187c9c8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.8/mektup_1.0.8_linux_arm64.tar.gz"
      sha256 "556762bda32a1dbfebf49845662f0a1635371ba3d716d7c69b3b9de2b0a919e6"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.8/mektup_1.0.8_linux_amd64.tar.gz"
      sha256 "5007be28eaa6446a220688a5f5a2dd9ad7879f2a511aaee866f34ce4837f95b6"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.8"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
