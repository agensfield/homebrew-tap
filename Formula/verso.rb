class Verso < Formula
  desc "Deliberate Codex account switching with one native working home"
  homepage "https://github.com/agensfield/verso"
  version "0.1.0-alpha.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.3/verso_0.1.0-alpha.3_darwin_arm64.tar.gz"
      sha256 "340543412b07b874a21f3a61748cfd83ca777b7bc68668d97c1ac893f0d7e1a2"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.3/verso_0.1.0-alpha.3_darwin_amd64.tar.gz"
      sha256 "c854169b708a6c0362511d3464dd609788a532a5148310b5a31fc188fee86cc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.3/verso_0.1.0-alpha.3_linux_arm64.tar.gz"
      sha256 "49628fe758df4b19b02a1324b669328ad4d28864ee59514909df535a129cd494"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.3/verso_0.1.0-alpha.3_linux_amd64.tar.gz"
      sha256 "d2e2a8f9ca8745b2993da6bbe91579d02e646fb225c938ca381a93dee5a11751"
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
