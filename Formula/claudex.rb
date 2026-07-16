class Claudex < Formula
  desc "Use Codex GPT models through the Claude Code interface"
  homepage "https://github.com/BeamoINT/Claudex"
  url "https://github.com/BeamoINT/Claudex/releases/download/v1.5.0/claudex-1.5.0.tar.gz"
  sha256 "0bba8450324e9653e5ed73012e295328804742eae918b5ce6c5510885fb3d2bb"
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
