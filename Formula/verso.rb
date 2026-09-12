class Verso < Formula
  desc "Deliberate Codex account switching with one native working home"
  homepage "https://github.com/agensfield/verso"
  version "0.1.0-alpha.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.6/verso_0.1.0-alpha.6_darwin_arm64.tar.gz"
      sha256 "773c64d966ceb38b12b7e28f848ac5a9356a4c556bb91d50b46baf1e8f058eea"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.6/verso_0.1.0-alpha.6_darwin_amd64.tar.gz"
      sha256 "849a9d88c7fcae503ff78408a9b4fa29c9a13b4cb38c77b371278b4019ca81e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.6/verso_0.1.0-alpha.6_linux_arm64.tar.gz"
      sha256 "c0dbae8871792588f902e8a0213a0d5abb9fb3d6239e7319a3342300bb8fd02f"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.6/verso_0.1.0-alpha.6_linux_amd64.tar.gz"
      sha256 "3df99ac7508dfc72f21abb720c2284fd044b5d9dc65d90d590ca5f58b4c6b843"
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
