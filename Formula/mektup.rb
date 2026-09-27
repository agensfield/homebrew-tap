# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.7/mektup_1.0.7_darwin_arm64.tar.gz"
      sha256 "e067023f74a49e2de735d9b847d63637bbf3df3747540d20f24e556583f78ac1"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.7/mektup_1.0.7_darwin_amd64.tar.gz"
      sha256 "28353f68c3d37a18f72f8591d7b516c3be98a1eef0785b4a443536f379515005"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.7/mektup_1.0.7_linux_arm64.tar.gz"
      sha256 "15b7ae673e374b06c98ee7e4e97d25e170145f6642c18f8aa15bf46d3f629313"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.7/mektup_1.0.7_linux_amd64.tar.gz"
      sha256 "8e07ad83e830d6f55af5c03dc6df2343fbfe6383c9442ce94987f11f5e8adccd"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.7"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
