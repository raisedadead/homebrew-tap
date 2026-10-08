class Sketchyusage < Formula
  desc "Claude and Codex usage for SketchyBar with a native panel"
  homepage "https://github.com/raisedadead/SketchyUsage"
  url "https://github.com/raisedadead/SketchyUsage.git",
      tag:      "v0.2.0",
      revision: "84ff7b9dd4417c6989413ba6c261656d99859772"
  license "ISC"
  head "https://github.com/raisedadead/SketchyUsage.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  service do
    run [opt_bin/"sketchyusage", "serve"]
    keep_alive crashed: true
    environment_variables PATH: std_service_path_env
    process_type :interactive
    log_path var/"log/sketchyusage.log"
    error_log_path var/"log/sketchyusage.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sketchyusage --version")
  end
end
