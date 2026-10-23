# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.15/mektup_1.0.15_darwin_arm64.tar.gz"
      sha256 "9e787b400c55eccef8681afc175bcfbf31f16ba48d4c459705a94d71d824cff9"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.15/mektup_1.0.15_darwin_amd64.tar.gz"
      sha256 "125cdfafbcdde5078e78db139f3683b38a57b382857ad26722857586c557096c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.15/mektup_1.0.15_linux_arm64.tar.gz"
      sha256 "1ea834c647f715ea02a7b0ee47855e5398c586a20b854ab88540b30bae521d04"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.15/mektup_1.0.15_linux_amd64.tar.gz"
      sha256 "8775e8c488d6b30f8c896b9f71a38731d1cbec4f86062ba3ad1cb978f0b0ae39"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.15"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
