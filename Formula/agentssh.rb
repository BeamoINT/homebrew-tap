# Homebrew formula for agentssh (AgentSSH CLI).
#
# Distributed npm-free: the self-contained CLI bundle (agentssh.mjs) is shipped as a
# GitHub Release asset on the PUBLIC tap repo (agentssh is private, so its own
# release assets are not anonymously downloadable). This file is the source of
# truth; the tap's Formula/agentssh.rb is kept identical.
#
# Release flow (no npm):
#   1. npm run bundle:publish -w @agentssh/cli   # builds packages/cli/dist-bundle/agentssh.mjs
#   2. tar -C packages/cli/dist-bundle -czf agentssh-<v>.tar.gz agentssh.mjs README.md LICENSE
#   3. gh release create agentssh-v<v> agentssh-<v>.tar.gz --repo BeamoINT/homebrew-tap
#   4. shasum -a 256 agentssh-<v>.tar.gz  -> update url/sha256 below
#   5. copy this file to BeamoINT/homebrew-tap Formula/agentssh.rb
#
#   brew install BeamoINT/tap/agentssh
#   brew upgrade agentssh

class Agentssh < Formula
  desc "CLI for AgentSSH agent API and MCP install"
  homepage "https://agentssh-beamo-20260920.pages.dev"
  url "https://github.com/BeamoINT/homebrew-tap/releases/download/agentssh-v0.1.1/agentssh-0.1.1.tar.gz"
  sha256 "9868b38b473087e1975f690fe08e204c84ed321a2caf7edf7d319ef05ed0cbf6"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "agentssh.mjs", "README.md", "LICENSE"
    (bin/"agentssh").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/agentssh.mjs" "$@"
    SH
    (bin/"agentssh").chmod 0755
  end

  test do
    assert_match "agentssh", shell_output("#{bin}/agentssh version")
  end
end
