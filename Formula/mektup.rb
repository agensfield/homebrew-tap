# frozen_string_literal: true

# Formula for the Mektup Codex agent messaging CLI.
class Mektup < Formula
  desc "Reliable Codex thread control and agent messaging"
  homepage "https://github.com/agensfield/mektup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.19/mektup_1.0.19_darwin_arm64.tar.gz"
      sha256 "af24dbdc656d52a74443133c73ad261383f1a2c5b69857dc27c58b828865ab1e"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.19/mektup_1.0.19_darwin_amd64.tar.gz"
      sha256 "49fff17738ce924d44c6422e2d660194f73a0df63fe2d6b929675350fd5f7996"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/mektup/releases/download/v1.0.19/mektup_1.0.19_linux_arm64.tar.gz"
      sha256 "a35e814862fef0ec741efcbef40aab1472738c1d4d243d046e7049c522631f6c"
    else
      url "https://github.com/agensfield/mektup/releases/download/v1.0.19/mektup_1.0.19_linux_amd64.tar.gz"
      sha256 "7aadd806ea1d72032af98393a110f7ebc1015f693bfc9601677dfe7dc09c2490"
    end
  end

  def install
    bin.install "mektup"
  end

  test do
    assert_match '"version":"1.0.19"', shell_output("#{bin}/mektup version --json")
    assert_match "Usage: mektup", shell_output("#{bin}/mektup --help")
  end
end
