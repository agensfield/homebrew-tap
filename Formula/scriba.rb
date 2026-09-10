class Scriba < Formula
  desc "Local-first usage tracking for Claude Code and Codex"
  homepage "https://github.com/agensfield/scriba"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v0.4.0/scriba_0.4.0_darwin_arm64.tar.gz"
      sha256 "63738c2b151fe605559d3b265dadf4e95b851a5f22669dd34a8fc34d9e38f5da"
    else
      url "https://github.com/agensfield/scriba/releases/download/v0.4.0/scriba_0.4.0_darwin_amd64.tar.gz"
      sha256 "9ac1515334d175e08e1b6374c2cb27014713efb8fcbc6503ddf3277f536c390b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v0.4.0/scriba_0.4.0_linux_arm64.tar.gz"
      sha256 "ed1cdf48b63e1044393ef89be926d94a5543a457337f44be5c3a859799b6560a"
    else
      url "https://github.com/agensfield/scriba/releases/download/v0.4.0/scriba_0.4.0_linux_amd64.tar.gz"
      sha256 "822ec4c5c71e6c3850d3c0065434c3efb04de3976b04161bd2903c98c427e772"
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
