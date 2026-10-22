class Ramiz < Formula
  desc "Ridiculously cheap Git worktrees using filesystem copy-on-write"
  homepage "https://github.com/agensfield/ramiz"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.3/ramiz_1.0.3_darwin_arm64.tar.gz"
      sha256 "1dfb34c18c8d5671a0e1e5ffd8c98d23d36088af3b969d4babcba5f8b39c975a"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.3/ramiz_1.0.3_darwin_amd64.tar.gz"
      sha256 "35970191392cfc02a05fc8d31a67c8371008e1e38a32b8aab1d60cfa2d959536"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.3/ramiz_1.0.3_linux_arm64.tar.gz"
      sha256 "602f89f278c58024173821ebd8067916036602d24ace645d644a600a3d0b5e8f"
    else
      url "https://github.com/agensfield/ramiz/releases/download/v1.0.3/ramiz_1.0.3_linux_amd64.tar.gz"
      sha256 "e2c3f25834abecdd993895d9acca9b20a2a09bd16b8bf0b0879ff5a2fc1c4231"
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
