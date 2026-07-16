class Claudex < Formula
  desc "Use Codex GPT models through the Claude Code interface"
  homepage "https://github.com/BeamoINT/Claudex"
  url "https://github.com/BeamoINT/Claudex/releases/download/v1.4.3/claudex-1.4.3.tar.gz"
  sha256 "b404099170eeb055e24cec12475dca68c45285d4d981d8f7d02089650711bd1f"
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
