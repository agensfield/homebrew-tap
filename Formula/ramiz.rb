class Ramiz < Formula
  desc "Ridiculously cheap Git worktrees using filesystem copy-on-write"
  homepage "https://github.com/agensfield/ramiz"
  version "1.0.0"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v#{version}/ramiz_#{version}_darwin_arm64.tar.gz"
      sha256 "27fca34d10a6d5671eac55ba59cdb269aea5b829ef98a5a1a4d55579b3b494ec"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v#{version}/ramiz_#{version}_darwin_amd64.tar.gz"
      sha256 "1b4067d2be466a887d7f10b7d81857bebca2dc4c31a69162701c2a26328057c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v#{version}/ramiz_#{version}_linux_arm64.tar.gz"
      sha256 "a04fee0548dfcb43b0d3229afa07b7598daa14ada10b465d544567cd9a85c1d9"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v#{version}/ramiz_#{version}_linux_amd64.tar.gz"
      sha256 "2f8a2fc0fa189a65f88e195bf6fa0a0c734bfb37a2815e3d9d8d7c63d76fc3db"
    end
  end

  def install
    bin.install "ramiz"
    bin.install "git-ramiz"
  end

  test do
    assert_equal "ramiz #{version}", shell_output("#{bin}/ramiz --version").strip
    assert_equal "ramiz #{version}", shell_output("#{bin}/git-ramiz --version").strip
    assert_equal "ramiz #{version}", shell_output("git ramiz --version").strip

    output = shell_output("#{bin}/ramiz update 2>&1", 1)
    assert_match "brew upgrade agensfield/tap/ramiz", output
  end
end
