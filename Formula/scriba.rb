class Scriba < Formula
  desc "Local-first usage tracking for Claude Code and Codex"
  homepage "https://github.com/agensfield/scriba"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_arm64.tar.gz"
      sha256 "df35e89fd429072c0b449f30d381af6327763d1cd57c29c33381c5629555d83b"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_amd64.tar.gz"
      sha256 "f2ec4c2ab03dd8e24ca498df3d946bed077c9b50975c1baa22288841cd673116"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_arm64.tar.gz"
      sha256 "dd9a8cd72ff7b7226d2141d557513d28577aed4db6d6f8eb4fb205dec4aa6521"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_amd64.tar.gz"
      sha256 "e72bc35103d893bb5e8d46ae0bd65ca19c3af20d10990044b557748743b1583f"
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
