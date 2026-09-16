# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.2/mektup_1.0.2_darwin_arm64.tar.gz"
      sha256 "a19dbd926d2ce0a87bc56b28d87f8565174cc78e161b42741558e7439bea3fb8"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.2/mektup_1.0.2_darwin_amd64.tar.gz"
      sha256 "fb65baa9c6f1dd1678b13814f19388ca36c38aa3bbe63a5f9448ce7a9972a9d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.2/mektup_1.0.2_linux_arm64.tar.gz"
      sha256 "6da86305ed2e1d864a5080c6f2160f94b46825ff360cc842cbe75e3676094dd7"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.2/mektup_1.0.2_linux_amd64.tar.gz"
      sha256 "73bf015920e8d5a0bdeb3a51de059f07d86376168d6c5860c7c7eb9f69436f5a"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.2"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
