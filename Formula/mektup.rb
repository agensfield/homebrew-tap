# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.13/mektup_1.0.13_darwin_arm64.tar.gz"
      sha256 "b199d4cd44980ee921cb57a333ac47c97def1f3331cd211195b8e62cfa044c2a"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.13/mektup_1.0.13_darwin_amd64.tar.gz"
      sha256 "25065096cd5667f9acd630c8a7935232d6eec4cb6efc37c4dcbf3bf216975397"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.13/mektup_1.0.13_linux_arm64.tar.gz"
      sha256 "5472c4bc37d98989d9190e9f5a65eb285611b8249b9f4200ebfad921d1563d6d"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.13/mektup_1.0.13_linux_amd64.tar.gz"
      sha256 "bd62952d284410a98ead143f7e30f0463b3c5cf5c2b032818fee32a96f89b3d8"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.13"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
