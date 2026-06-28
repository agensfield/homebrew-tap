class Scriba < Formula
  desc "Local-first usage tracking for Claude Code and Codex"
  homepage "https://github.com/agensfield/scriba"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_arm64.tar.gz"
      sha256 "601057c1a3678f11bf74a566d093131cfffefb5cf6677a904b0f1f067e300638"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_amd64.tar.gz"
      sha256 "f176beb637ce76a4adff51e3e0c02243911a3f40d1265d5dcacabae887e8c832"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_arm64.tar.gz"
      sha256 "03aa1af20c3b5bf9b13f0d470592856065d430dc2d0831d75ef2c0fd63cf3615"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_amd64.tar.gz"
      sha256 "5063086bd563554ec28d4c3ff6d7a8908f05fe6ecf25cb4312bb387c32835584"
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
