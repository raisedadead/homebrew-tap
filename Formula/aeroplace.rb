class Aeroplace < Formula
  desc "Places floating windows for the AeroSpace window manager"
  homepage "https://github.com/raisedadead/aeroplace"
  url "https://github.com/raisedadead/aeroplace.git",
      tag:      "v0.1.1",
      revision: "c8ecef8ac4703b91e1c5cd99d500be38abd48ffd"
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
