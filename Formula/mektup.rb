# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.21/mektup_1.0.21_darwin_arm64.tar.gz"
      sha256 "150c1f80ee8795394a4462ff7c30d383d4b870d0e8da8cb76c1b9ff86753c565"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.21/mektup_1.0.21_darwin_amd64.tar.gz"
      sha256 "04673060d3aca060b852241ef929ce44099df58a28ddde3a34d128cdb35e8669"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.21/mektup_1.0.21_linux_arm64.tar.gz"
      sha256 "cbb0d13693a3a9569d79468f52240bd364c89d7e3310b012d7faeb6deadf4d88"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.21/mektup_1.0.21_linux_amd64.tar.gz"
      sha256 "4e1847769aea32ba2a99baad81343f4633d5924b5e77809a39cd0ea24c051eb0"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.21"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
