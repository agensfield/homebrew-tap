# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.17/mektup_1.0.17_darwin_arm64.tar.gz"
      sha256 "70d25f1982d1a3619196f3af33de396bf9640b0e84bc8199d703f059a5f0579f"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.17/mektup_1.0.17_darwin_amd64.tar.gz"
      sha256 "445ae8ec9429c75b1b16fbffcd774b761642162941b520658673fa13453df41c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.17/mektup_1.0.17_linux_arm64.tar.gz"
      sha256 "3dc57f7781c81c3a9d0cbcb5c72dadc482bd893fcc5731e4532e95ea3a32c5b6"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.17/mektup_1.0.17_linux_amd64.tar.gz"
      sha256 "ef87c2720070d5156e281ed8e32d9f283ed5f90354f093e5523f8d81bf919e04"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.17"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
