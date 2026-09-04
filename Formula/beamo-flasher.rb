class BeamoFlasher < Formula
  desc "CLI for Beamo Flasher and Beamo Pi — verified removable-media flashing"
  homepage "https://beamo.tech/flasher-download"
  url "https://github.com/BeamoINT/beamo-flasher-releases/releases/download/v0.5.21/beamo-flasher-cli-v0.5.21.zip"
  sha256 "34910fa75c9044fa2e7e3f41cbf22fcd438c964615fbee303d2a1cf00f31f581"
  license "MIT"

  depends_on "node"
  depends_on "xz"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"beamo-flasher.cjs"
    %w[bflash beamo-flasher].each do |cmd|
      (bin/cmd).write <<~EOS
        #!/bin/bash
        set -euo pipefail
        export BEAMO_PRODUCT=flasher
        exec node "#{libexec}/beamo-flasher.cjs" "$@"
      EOS
      chmod 0755, bin/cmd
    end
    %w[bpi beamo-pi].each do |cmd|
      (bin/cmd).write <<~EOS
        #!/bin/bash
        set -euo pipefail
        export BEAMO_PRODUCT=pi
        exec node "#{libexec}/beamo-flasher.cjs" "$@"
      EOS
      chmod 0755, bin/cmd
    end
  end

  test do
    assert_match "Beamo Flasher CLI", shell_output("#{bin}/bflash --help")
    assert_match "Beamo Flasher CLI", shell_output("#{bin}/beamo-flasher --help")
    assert_match "Beamo Pi", shell_output("#{bin}/bpi --help")
    assert_match "Beamo Pi", shell_output("#{bin}/beamo-pi --help")
  end
end
