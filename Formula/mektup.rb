# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.12/mektup_1.0.12_darwin_arm64.tar.gz"
      sha256 "b39b46cdd4161f2154bce43729a73bf52fe10688aa9e3ce7c7e2ddbfd44ac8ef"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.12/mektup_1.0.12_darwin_amd64.tar.gz"
      sha256 "05035fc5405430ddc33d1ed876ca5b9dda9d03399ecfd8df464b501995a1cb66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.12/mektup_1.0.12_linux_arm64.tar.gz"
      sha256 "4c3d42833b79df83261191c0d0dcdfb0569caa930d59585b10d511ba3e37867c"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.12/mektup_1.0.12_linux_amd64.tar.gz"
      sha256 "b19a56a4e483d642ffd546a49674dbcc74be2262a2df3a3db556cb2b3715bcd5"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.12"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
