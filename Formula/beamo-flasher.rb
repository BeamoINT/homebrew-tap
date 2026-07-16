class BeamoFlasher < Formula
  desc "CLI for flashing verified removable-media images"
  homepage "https://github.com/BeamoINT/beamo-flasher"
  url "https://github.com/BeamoINT/beamo-flasher-releases/releases/download/v0.3.1/beamo-flasher-cli-v0.3.1.zip"
  sha256 "89b93b8dfb6326d678ad5da3da25b65941d067527f70bea74083a88be116dff4"
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
