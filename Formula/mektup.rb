# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.3/mektup_1.0.3_darwin_arm64.tar.gz"
      sha256 "18e86f7d73b836dac4b998a31240804491ead3bce4f13819dbc6e7d960729ab5"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.3/mektup_1.0.3_darwin_amd64.tar.gz"
      sha256 "4e7a4da8f29fe18fcaeac6c6d39f9f9ac46f9e7601e285fe8e58199c88f35b5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.3/mektup_1.0.3_linux_arm64.tar.gz"
      sha256 "36c00dea194b58d3fe9eb9237127dd9871c1ed9debdbfe5a92013c55e415fc89"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.3/mektup_1.0.3_linux_amd64.tar.gz"
      sha256 "e4913bfcb168e8b492fb24f3104972cb04098a028e983bd73861fd24038b1882"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.3"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
