class Verso < Formula
  desc "Deliberate Codex account switching with one native working home"
  homepage "https://github.com/agensfield/verso"
  version "0.1.0-alpha.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.7/verso_0.1.0-alpha.7_darwin_arm64.tar.gz"
      sha256 "c4f790f8c4bc7e4d3a52a9d4b2a9853ef31d4bbb0b5a39e1e0988d34c6aac55d"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.7/verso_0.1.0-alpha.7_darwin_amd64.tar.gz"
      sha256 "af32ccf18385e28b9fe8b8a27e154eecd18087b0cbbe8f215a792263abd29d6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.7/verso_0.1.0-alpha.7_linux_arm64.tar.gz"
      sha256 "1b67136b43d5a2f9d6b6d1d702b0b05fce75202c4054b6b96d8adb4a0e10c86d"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.7/verso_0.1.0-alpha.7_linux_amd64.tar.gz"
      sha256 "c5c11e27d992193ab5a9034eaeca371bd74917ac78c3cfdd981b9b114757d047"
    end
  end

  def install
    bin.install "verso"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/verso version")
    assert_match "Usage:", shell_output("#{bin}/verso --help")
    assert_match "brew upgrade verso", shell_output("#{bin}/verso update 2>&1", 1)
  end
end
