# Retired legacy agent client. BrowserSSH now provides browser SSH only.
class Bssh < Formula
  desc "Retired BrowserSSH agent CLI; use AgentSSH"
  homepage "https://browserssh.com"
  url "https://github.com/BeamoINT/homebrew-tap/releases/download/bssh-v0.1.1/bssh-0.1.1.tar.gz"
  sha256 "304a459b5c2b623940f229c8c00b0bde92d5e7c4dc7ad92d168784c18fb773c1"
  license "MIT"

  disable! date: "2026-09-20", because: "its agent API moved to AgentSSH", replacement_formula: "BeamoINT/tap/agentssh"

  depends_on "node"

  def install
    libexec.install "bssh.mjs", "README.md", "LICENSE"
    (bin/"bssh").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bssh.mjs" "$@"
    SH
    (bin/"bssh").chmod 0755
  end

  test do
    assert_match "bssh", shell_output("#{bin}/bssh version")
  end
end
