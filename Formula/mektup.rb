# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.5/mektup_1.0.5_darwin_arm64.tar.gz"
      sha256 "35e1bd923182db9e128b18b8ffb0d7c49ee43d3d044394bc3e096bff0e55830f"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.5/mektup_1.0.5_darwin_amd64.tar.gz"
      sha256 "196a7b55a12ce15a7af995f93882e5cb94797cf5a50c9ba6e520a731b524403b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.5/mektup_1.0.5_linux_arm64.tar.gz"
      sha256 "83de3826fdc501d3202719f2cfbf5533fd188bbdc7df219365954b270eff2c66"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.5/mektup_1.0.5_linux_amd64.tar.gz"
      sha256 "99a1441b510e4d0745a2b3f32f32aba070c11b372c4fad0e9cec00daa097ac29"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.5"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
