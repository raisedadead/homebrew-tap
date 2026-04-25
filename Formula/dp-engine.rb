class DpEngine < Formula
  desc "Beads-native engine for dp-cto orchestration"
  homepage "https://github.com/raisedadead/dotplugins"
  version "8.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.2/dp-engine-darwin-arm64"
      sha256 "554f20742788109ab8054f4365b962a375c43f0753ef0f1179e812bf8eaffabb"
    else
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.2/dp-engine-darwin-amd64"
      sha256 "6884b37b141d23426c9bd9eb9b4a18b3c901a6a545abedf4d081f8ef51d15625"
    end
  end

  on_linux do
    url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.2/dp-engine-linux-amd64"
    sha256 "7fd2b22c601ebb3389a65327a8db0d071d79db8efb45222a9a6bbb5b00cb4d08"
  end

  def install
    bin.install Dir["dp-engine-*"].first => "dp-engine"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dp-engine --version")
  end
end
