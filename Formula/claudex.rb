class Claudex < Formula
  desc "Use Codex GPT models through the Claude Code interface"
  homepage "https://github.com/BeamoINT/Claudex"
  url "https://github.com/BeamoINT/Claudex/releases/download/v1.4.4/claudex-1.4.4.tar.gz"
  sha256 "3213faf456b2b1ee83510e2d16756ba9e84c8c4450a9d72788ab6989748d92ee"
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
