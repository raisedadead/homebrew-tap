class DpEngine < Formula
  desc "Beads-native engine for dp-cto orchestration"
  homepage "https://github.com/raisedadead/dotplugins"
  version "8.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.4/dp-engine-darwin-arm64"
      sha256 "f1b0e19df34c32594903192f03cbc10dd2c66389d0e9e64bc25108aa8a76d00e"
    else
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.4/dp-engine-darwin-amd64"
      sha256 "c665d9c48b9e9ca95d934c5abff66192da0c5511f2969cef1b2b9a2ef0fcec51"
    end
  end

  on_linux do
    url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.4/dp-engine-linux-amd64"
    sha256 "9c5ac014620903682aaa36212e439557a10219f72a95b36e4e4a31e86bf6a78f"
  end

  def install
    bin.install Dir["dp-engine-*"].first => "dp-engine"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dp-engine --version")
  end
end
