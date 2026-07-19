# Homebrew formula for bssh (Browser SSH CLI).
#
# Distributed npm-free: the self-contained CLI bundle (bssh.mjs) is shipped as a
# GitHub Release asset on the PUBLIC tap repo (browserssh is private, so its own
# release assets are not anonymously downloadable). This file is the source of
# truth; the tap's Formula/bssh.rb is kept identical.
#
# Release flow (no npm):
#   1. npm run bundle:publish -w @browserssh/cli   # builds packages/cli/dist-bundle/bssh.mjs
#   2. tar -C packages/cli/dist-bundle -czf bssh-<v>.tar.gz bssh.mjs README.md LICENSE
#   3. gh release create bssh-v<v> bssh-<v>.tar.gz --repo BeamoINT/homebrew-tap
#   4. shasum -a 256 bssh-<v>.tar.gz  -> update url/sha256 below
#   5. copy this file to BeamoINT/homebrew-tap Formula/bssh.rb
#
#   brew install BeamoINT/tap/bssh
#   brew upgrade bssh

class Bssh < Formula
  desc "CLI for Browser SSH agent API and MCP install"
  homepage "https://browserssh.com"
  url "https://github.com/BeamoINT/homebrew-tap/releases/download/bssh-v0.1.0/bssh-0.1.0.tar.gz"
  sha256 "d3c09c2ba595727eeb5b778d9c24ad626763be89a467fb954e2ced97ab71bdb1"
  license "MIT"

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
