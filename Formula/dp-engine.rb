class DpEngine < Formula
  desc "Beads-native engine for dp-cto orchestration"
  homepage "https://github.com/raisedadead/dotplugins"
  version "8.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.0/dp-engine-darwin-arm64"
      sha256 "b553c6ea6808d6e2cd94f9d2dd6a7efc561d7a0b87e8ad4b803df92072799631"
    else
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.0/dp-engine-darwin-amd64"
      sha256 "5c62d057296a15e71dbb277ef4403c524de29b0df137d293d9e71bafae908515"
    end
  end

  on_linux do
    url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.0/dp-engine-linux-amd64"
    sha256 "f6498d92d107811ec83842c80f2e29698784118fb5f23a867045f8045dc5dfd5"
  end

  def install
    bin.install Dir["dp-engine-*"].first => "dp-engine"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dp-engine --version")
  end
end
