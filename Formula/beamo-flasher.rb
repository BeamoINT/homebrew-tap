class BeamoFlasher < Formula
  desc "CLI for flashing verified removable-media images"
  homepage "https://beamo.tech/flasher-download"
  url "https://github.com/BeamoINT/beamo-flasher-releases/releases/download/v0.5.12/beamo-flasher-cli-v0.5.12.zip"
  sha256 "acf7b654fd8b713bcd8b6cfab6c3e1df97e9eeda799edc120c6d3394f15f3afa"
  license "MIT"

  depends_on "node"
  depends_on "xz"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"beamo-flasher.cjs"
    (bin/"bflash").write_exec_script libexec/"beamo-flasher.cjs"
    (bin/"beamo-flasher").write_exec_script libexec/"beamo-flasher.cjs"
  end

  test do
    assert_match "Beamo Flasher CLI", shell_output("#{bin}/bflash --help")
    assert_match "Beamo Flasher CLI", shell_output("#{bin}/beamo-flasher --help")
  end
end
