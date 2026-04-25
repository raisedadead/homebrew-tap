class DpEngine < Formula
  desc "Beads-native engine for dp-cto orchestration"
  homepage "https://github.com/raisedadead/dotplugins"
  version "8.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.3/dp-engine-darwin-arm64"
      sha256 "903d3e10bd161bfc145cdfcc8656f72771f66697f7bc86ea05e7580ebc0ef6ee"
    else
      url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.3/dp-engine-darwin-amd64"
      sha256 "3f18c444c4ab88252689ff14423fb15bbcdf6e82b347fc86b42fb5d0d707b4bf"
    end
  end

  on_linux do
    url "https://github.com/raisedadead/dotplugins/releases/download/v8.6.3/dp-engine-linux-amd64"
    sha256 "0f8a5df4544cda4766d6d0b5a484ed8767032fc146709599f69a2ade2cbeca7a"
  end

  def install
    bin.install Dir["dp-engine-*"].first => "dp-engine"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dp-engine --version")
  end
end
