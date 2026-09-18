class Ramiz < Formula
  desc "Ridiculously cheap Git worktrees using filesystem copy-on-write"
  homepage "https://github.com/agensfield/ramiz"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.2/ramiz_1.0.2_darwin_arm64.tar.gz"
      sha256 "b5ee494669e4d2d327338dcc068e995c27aa1f05a6e19d35ce38ccc90249bbbc"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.2/ramiz_1.0.2_darwin_amd64.tar.gz"
      sha256 "54d88c794d3c7d644c5b6f5830622c4be087e185fb8c244bdbc8d0972606ae9d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.2/ramiz_1.0.2_linux_arm64.tar.gz"
      sha256 "2555baf0b2abd74f49331233508818db3482b7f209731cf17d3ed7e8abd3fd4f"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.2/ramiz_1.0.2_linux_amd64.tar.gz"
      sha256 "a73cb608bd500aa05258985d80c41344109ac1ae67b0049b8733c55b6b9610dd"
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
