# frozen_string_literal: true

# Agensfield copy-on-write Git worktrees.
class Ramiz < Formula
  desc "Ridiculously cheap Git worktrees using filesystem copy-on-write"
  homepage "https://github.com/agensfield/ramiz"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.4/ramiz_1.0.4_darwin_arm64.tar.gz"
      sha256 "e01c72873e73253ae14bb23274cbed5a116bb592dbc0910dd62c9aee150852f7"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.4/ramiz_1.0.4_darwin_amd64.tar.gz"
      sha256 "4637935160b81a564b5a9ddacdeaf2e0a694b32016ae2ef997f1772569ffce50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.4/ramiz_1.0.4_linux_arm64.tar.gz"
      sha256 "a5b68a185aef927e7a4d21cc137eb0fa41d33fa07520bf1c8e5eeb72dfa5e88d"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.4/ramiz_1.0.4_linux_amd64.tar.gz"
      sha256 "afba5392242375e2ca503c8206126f552374e2531534f1b5547152f68232cf4a"
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
