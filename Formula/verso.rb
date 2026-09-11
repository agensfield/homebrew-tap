class Verso < Formula
  desc "Deliberate Codex account switching with one native working home"
  homepage "https://github.com/agensfield/verso"
  version "0.1.0-alpha.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.4/verso_0.1.0-alpha.4_darwin_arm64.tar.gz"
      sha256 "80f5980e75f9695afcb08cd023bd84bc58952898f208d0531363e5033fffac39"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.4/verso_0.1.0-alpha.4_darwin_amd64.tar.gz"
      sha256 "911514bc868f7894de22e6f946daca069ab7195066268811a2b65be96cc11a48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.4/verso_0.1.0-alpha.4_linux_arm64.tar.gz"
      sha256 "cd9c51933d2767f5d3c4258170159e16778efe8d3e091650f7a361b49f5b7df5"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.4/verso_0.1.0-alpha.4_linux_amd64.tar.gz"
      sha256 "d151861248f2dbcf18ccb1f158769e608e9a6582a9cdf200e4c9695d1c4792f1"
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
