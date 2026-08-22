class BeamoFlasher < Formula
  desc "CLI for flashing verified removable-media images"
  homepage "https://beamo.tech/flasher-download"
  url "https://github.com/BeamoINT/beamo-flasher-releases/releases/download/v0.5.14/beamo-flasher-cli-v0.5.14.zip"
  sha256 "d6247d4022bd90a622f51fe3f8130f859b898a2a5b7905642696235ed1ac27e0"
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
