# frozen_string_literal: true

# Agensfield distribution with verified worktree reconciliation.
class Asimov < Formula
  desc "Verified Time Machine exclusions for development worktrees"
  homepage "https://github.com/agensfield/asimov"
  url "https://github.com/agensfield/asimov/releases/download/v0.13.1/asimov-0.13.1.tar.gz"
  sha256 "58c279006977bb2f11f8b1c9389f909434d483fdc0db7a451aea8d564a1abd8c"
  license "MIT"
  revision 1

  depends_on "git"
  depends_on :macos
  depends_on "python@3.15"

  def install
    inreplace "bin/asimov", "exec python3 ",
              "exec #{formula_opt_bin("python@3.15")}/python3.15 "
    bin.install Dir["bin/*"]
    (libexec/"asimov").install Dir["lib/asimov/*"]
    pkgshare.install Dir["data/*"]
    (pkgshare/"config").install Dir["config/*"]
  end

  service do
    run [opt_bin/"asimov-service"]
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
  end
end
