class Aeroplace < Formula
  desc "Places floating windows for the AeroSpace window manager"
  homepage "https://github.com/raisedadead/aeroplace"
  url "https://github.com/raisedadead/aeroplace.git",
      tag:      "v0.1.0",
      revision: "bf5453a962f7e9b866cb5606892bde8da119064d"
  license "ISC"
  head "https://github.com/raisedadead/aeroplace.git", branch: "main"

  depends_on :macos

  uses_from_macos "swift" => :build, since: :sequoia

  def install
    system "swift", "build", *std_swift_args
    bin.install ".build/release/aeroplace"
    pkgshare.install Dir["lua/*.lua"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aeroplace --version")
  end
end
