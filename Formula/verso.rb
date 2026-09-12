class Verso < Formula
  desc "Deliberate Codex account switching with one native working home"
  homepage "https://github.com/agensfield/verso"
  version "0.1.0-alpha.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.5/verso_0.1.0-alpha.5_darwin_arm64.tar.gz"
      sha256 "ab275ba38b56eecc0832f0c89bf2797ba6fbc958b295ab436d866b444c8fdf70"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.5/verso_0.1.0-alpha.5_darwin_amd64.tar.gz"
      sha256 "9bbf38201b5857dcaec0ea15d3a6b76eb31b7cefb4b7a4a032d5da8954b6b8a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.5/verso_0.1.0-alpha.5_linux_arm64.tar.gz"
      sha256 "576165c8f5811a411ebb28314ce90b3e0fdcc59450775b3600c9b07913d5206d"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.5/verso_0.1.0-alpha.5_linux_amd64.tar.gz"
      sha256 "ecda4007dacad41dd609f1f6852bf6ad5ec32d548bfeb4c67b0bb7e5fbc43184"
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
