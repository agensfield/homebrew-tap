# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.18/mektup_1.0.18_darwin_arm64.tar.gz"
      sha256 "1c018349ae5cefdc7308133f6bf9b80088e712ee5119a1762781fdd3c72d195c"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.18/mektup_1.0.18_darwin_amd64.tar.gz"
      sha256 "f6f0ab9ae42a759fdcb2b48d886d7b17285a955bf11b8214295e4c12bdf41c36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.18/mektup_1.0.18_linux_arm64.tar.gz"
      sha256 "966c37f0d0f4c6d8af69b507a4fc28ed112c996238eb72748ef2dd4fe1295f4e"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.18/mektup_1.0.18_linux_amd64.tar.gz"
      sha256 "d0b2da64469cb610e4c50c66d2c50c48922084a9a47f66f0ed3feebc1bad478e"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.18"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
