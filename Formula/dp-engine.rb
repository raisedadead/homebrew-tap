class DpEngine < Formula
  desc "Beads-native engine for dp-cto orchestration"
  homepage "https://github.com/raisedadead/dotplugins"
  version "8.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.5/dp-engine-darwin-arm64"
      sha256 "604a66377a5e7a9543f6f629391ea7d153808312d1b600ae1ec1d37d6c20e8f8"
    else
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.5/dp-engine-darwin-amd64"
      sha256 "32a49dd0b782e272e6f395e65a4e30914ac202592e7e7ddd30cf9bc20964e877"
    end
  end

  on_linux do
    url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.5/dp-engine-linux-amd64"
    sha256 "c62b4de82c64efae3d86f44fcfd68e90f6b3cb1a92533a7f4a923970aeb2bd1a"
  end

  def install
    bin.install Dir["dp-engine-*"].first => "dp-engine"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dp-engine --version")
  end
end
