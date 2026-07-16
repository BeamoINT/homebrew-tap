class Claudex < Formula
  desc "Use Codex GPT models through the Claude Code interface"
  homepage "https://github.com/BeamoINT/Claudex"
  url "https://github.com/BeamoINT/Claudex/releases/download/v1.4.0/claudex-1.4.0.tar.gz"
  sha256 "04a3001e6ddd44ef84f64333a4090f5f41ca0bd7ecc34793e26095a76c664d36"
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
