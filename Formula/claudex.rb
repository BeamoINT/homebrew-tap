class Claudex < Formula
  desc "Use Codex GPT models through the Claude Code interface"
  homepage "https://github.com/BeamoINT/Claudex"
  url "https://github.com/BeamoINT/Claudex/releases/download/v1.4.2/claudex-1.4.2.tar.gz"
  sha256 "b5cdf0763f291a1d9e87673337c3b0f298fa672976b1fc2e0dfd5c6ad0f9fd79"
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
