class Scriba < Formula
  desc "Local-first usage tracking for Claude Code and Codex"
  homepage "https://github.com/agensfield/scriba"
  version "0.2.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_arm64.tar.gz"
      sha256 "eee6428366c12d6e3556b6e436cd902a98f212947e697e60446d92e02f9f114f"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_darwin_amd64.tar.gz"
      sha256 "2739df14455cf99be72732fa324777dac9cde89d6e5742da8f7fae40c7cc04d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_arm64.tar.gz"
      sha256 "8b52b0d4d1688afaceee1bbde6bb482047f1d14dae5695725eef4076b7e17d6e"
    else
      url "https://github.com/agensfield/scriba/releases/download/v#{version}/scriba_#{version}_linux_amd64.tar.gz"
      sha256 "0a126821e5d4edcd8cfb5e80d22abc12515efdb3aeb4c08db4a10c36d2afb276"
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
