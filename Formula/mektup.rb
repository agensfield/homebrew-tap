# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.11/mektup_1.0.11_darwin_arm64.tar.gz"
      sha256 "b7324bbc202306351c197441373a3a1c6e7b9510822aa1325964f72466756e7f"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.11/mektup_1.0.11_darwin_amd64.tar.gz"
      sha256 "498949a10513973602ea88050acea068d9ce2344c53812bf843e0cd9039d162c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.11/mektup_1.0.11_linux_arm64.tar.gz"
      sha256 "7fa15a3f405f24ab91d5e09b65a6d698a77879a06472b82af9da69acc0b3de7b"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.11/mektup_1.0.11_linux_amd64.tar.gz"
      sha256 "750fdad52d4e22db7459a7f86df52fb63687c8557daffbcf2b7bcf6cd62b72b2"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.11"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
