class Verso < Formula
  desc "Deliberate Codex account switching with one native working home"
  homepage "https://github.com/agensfield/verso"
  version "0.1.0-alpha.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.2/verso_0.1.0-alpha.2_darwin_arm64.tar.gz"
      sha256 "3027e5f1a3a4ab88ba2e2ced3f42abbf6d342247d68dcb0473dd436315b125bf"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.2/verso_0.1.0-alpha.2_darwin_amd64.tar.gz"
      sha256 "c77e0856e1f50f370dfa0b3073060799b6a99ffac86f5aa845f22438a3202d6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.2/verso_0.1.0-alpha.2_linux_arm64.tar.gz"
      sha256 "ce7a904745668b0bd803099bf8f9092ec1406fc7d638d0bc2b18613aa4fd37a4"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.2/verso_0.1.0-alpha.2_linux_amd64.tar.gz"
      sha256 "cec26136762686db476fe08b6f84ef18de0eb3a12ed3ed5414c564ebcda7ca27"
    end
  end

  def install
    bin.install "verso"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/verso version")
    assert_match "Usage:", shell_output("#{bin}/verso --help")
    assert_match "brew upgrade verso", shell_output("#{bin}/verso update 2>&1", 1)
  end
end
