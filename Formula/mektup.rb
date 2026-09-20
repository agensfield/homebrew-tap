# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.4/mektup_1.0.4_darwin_arm64.tar.gz"
      sha256 "4caee0c07c1e1bf5b2731600746915267f3737e049d8a4625b09fbd72cc98df6"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.4/mektup_1.0.4_darwin_amd64.tar.gz"
      sha256 "3a32de891e9f0a8e5d8f58400bf9fa34d9f150804a9c7e1fcc363bde19bb0d42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.4/mektup_1.0.4_linux_arm64.tar.gz"
      sha256 "ef0f5b758df553311cb30d05c99e77ae3d26d0367584022c2e6c14435a43dbe6"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.4/mektup_1.0.4_linux_amd64.tar.gz"
      sha256 "6e2631c5302854c93e82c64bc1bb09890f8267456d2fdf7495c1bfd2b81f7a3b"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.4"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
