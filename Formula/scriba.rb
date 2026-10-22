class Scriba < Formula
  desc "Local-first usage tracking for Claude Code and Codex"
  homepage "https://github.com/agensfield/scriba"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v0.4.1/scriba_0.4.1_darwin_arm64.tar.gz"
      sha256 "18f08cfab92a74486335be9a8b45a28e0799f64efa0dccb846ef53df502d2de6"
    else
      url "https://github.com/agensfield/scriba/releases/download/v0.4.1/scriba_0.4.1_darwin_amd64.tar.gz"
      sha256 "bd212355e05e0fa5eaeb4f86004344cee79ccdd0223517c587ded8fc52ae249d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v0.4.1/scriba_0.4.1_linux_arm64.tar.gz"
      sha256 "57b398fa5e5fbdfc2fb33a98351973979e855c53b2fe840181f925801474d70a"
    else
      url "https://github.com/agensfield/scriba/releases/download/v0.4.1/scriba_0.4.1_linux_amd64.tar.gz"
      sha256 "c3131f87962bd3dba3e95363009b5d0e6c2a1a81179620daf6ed295b8bfb3cbd"
    end
  end

  def install
    bin.install "scriba"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scriba --version")
    assert_match "commands", shell_output("#{bin}/scriba schema")
  end
end
