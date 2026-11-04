# frozen_string_literal: true

# Agensfield distribution with verified worktree reconciliation.
class Asimov < Formula
  desc "Verified Time Machine exclusions for development worktrees"
  homepage "https://github.com/agensfield/asimov"
  url "https://github.com/agensfield/asimov/releases/download/v0.15.0/asimov-0.15.0.tar.gz"
  sha256 "b1f7bbe0b3be838192c3d6ad32c64fa491952ba2983622bb25f4e7adf2438d60"
  license "MIT"

  depends_on "git"
  depends_on :macos
  depends_on "python@3.15"

  def install
    system ENV.cc, "-fobjc-arc", "-O2", "-Wall", "-Wextra", "-Werror",
           "-framework", "Foundation", "lib/asimov/background.m",
           "-DASIMOV_EXECUTABLE=\"#{opt_bin}/asimov\"", "-o", "bin/asimov-background"
    inreplace "bin/asimov", "exec python3 ",
              "exec #{formula_opt_bin("python@3.15")}/python3.15 "
    bin.install Dir["bin/*"]
    (libexec/"asimov").install Dir["lib/asimov/*"]
    pkgshare.install Dir["data/*"]
    (pkgshare/"config").install Dir["config/*"]
  end

  service do
    app = "/Applications/Asimov Background.app/Contents/MacOS/asimov-background"
    run [File.executable?(app) ? app : opt_bin/"asimov-background"]
    run_type :interval
    interval 900
    # Successful JSON receipts already have bounded retention in user state.
    log_path File::NULL
    error_log_path var/"log/asimov-error.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/asimov --version").strip
    assert_match "--dry-run", shell_output("#{bin}/asimov reconcile --help")
    assert_path_exists libexec/"asimov/reconcile.py"
    assert_path_exists libexec/"asimov/path_helper.py"
    assert_path_exists libexec/"asimov/install_path_helper.py"
    assert_match "background launcher", shell_output("#{bin}/asimov-background --version")
    assert_match "--identity", shell_output("#{bin}/asimov setup-background --help")
  end
end
