class Scriba < Formula
  desc "Local-first usage tracking for Claude Code and Codex"
  homepage "https://github.com/agensfield/scriba"
  version "0.3.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_arm64.tar.gz"
      sha256 "4a85b045f455944c020e9bb9e12b9572b018d0305248ec867e283f6b75cf9a5a"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_amd64.tar.gz"
      sha256 "44550963cfc012892b763be6d309b5e5afae6657350cccf530abe21a0da2dfe2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_arm64.tar.gz"
      sha256 "0031cff23d578e86834ded298078d589b2557f96896d85479b0099e5b108d3af"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_amd64.tar.gz"
      sha256 "c9fa472620fd19aaec3d1a7e93577a5e46cb3c4c58914fb951834b74c706d3a7"
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
