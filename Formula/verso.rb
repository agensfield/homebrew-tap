class Verso < Formula
  desc "Deliberate Codex account switching with one native working home"
  homepage "https://github.com/agensfield/verso"
  version "0.1.0-alpha.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.8/verso_0.1.0-alpha.8_darwin_arm64.tar.gz"
      sha256 "ef83dfedef2233a792aed58d744721fafbf0d3c06acefdbb16a272e09e9933fc"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.8/verso_0.1.0-alpha.8_darwin_amd64.tar.gz"
      sha256 "4a8782897d5956f852df0a062d43ae5f202c8c81d028264cabaf5724bb5ab0e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.8/verso_0.1.0-alpha.8_linux_arm64.tar.gz"
      sha256 "96579d02da6d0511ccf6dba9fa9fcadb2e237cd1a9745f52dc71d8525e9db085"
    else
      url "https://github.com/agensfield/verso/releases/download/v0.1.0-alpha.8/verso_0.1.0-alpha.8_linux_amd64.tar.gz"
      sha256 "c1a59670e97a98b645d5f6ac51bd0a01e26fabc1fefe14bfcf8e539add0b3550"
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
