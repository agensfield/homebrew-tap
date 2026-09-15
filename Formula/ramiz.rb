class Ramiz < Formula
  desc "Ridiculously cheap Git worktrees using filesystem copy-on-write"
  homepage "https://github.com/agensfield/ramiz"
  version "1.0.1"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v#{version}/ramiz_#{version}_darwin_arm64.tar.gz"
      sha256 "2122673bbbfdb0be4f90889e5360c439103879e886ddaa9f69addfd27ee8de5b"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v#{version}/ramiz_#{version}_darwin_amd64.tar.gz"
      sha256 "44b512f756ea19a1645fdbbae057a9a5e6d98a69af09885469eeb8320b5b370f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v#{version}/ramiz_#{version}_linux_arm64.tar.gz"
      sha256 "ac3363f6466221c7673da5d4488168ffed47159ff9b17b018a00b35dcdd780c7"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v#{version}/ramiz_#{version}_linux_amd64.tar.gz"
      sha256 "647f9ba32ff1b882e62b05eee8da7e21863f53d3cc9d2cfc20483c326cb44198"
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
