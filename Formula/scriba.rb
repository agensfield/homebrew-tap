class Scriba < Formula
  desc "Local-first usage tracking for Claude Code and Codex"
  homepage "https://github.com/agensfield/scriba"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_arm64.tar.gz"
      sha256 "bbfd76b55845974be69d4a8a43baa67c4386e75a862fcdf154ce92f354bc3591"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_amd64.tar.gz"
      sha256 "f599f60b5813ad2f3980bb498abcf578ee991df7c42b24e24e6ef85e1bd97e7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_arm64.tar.gz"
      sha256 "b41775a3797312c422bde2542a2054d7031f7fda9da2f4da77598d9a6c21106d"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_amd64.tar.gz"
      sha256 "e0a824c8f968bab7f342d1d630c419f2b39801c65d2e6e318dd4757057717d0f"
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
