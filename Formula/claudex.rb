class Claudex < Formula
  desc "Run Claude and GPT models through Claude Code with isolated provider routing"
  homepage "https://github.com/BeamoINT/Claudex"
  url "https://github.com/BeamoINT/Claudex/releases/download/v1.6.1/claudex-1.6.1.tar.gz"
  sha256 "331fed18fc88e4c2000320db767bc3635bc24bbe3962136ca4458af8f0e53ba4"
  license "MIT"

  depends_on "jq"
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/claudex-package.mjs"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/claudex --package-version").strip
  end
end
