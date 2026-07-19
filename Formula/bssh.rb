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
  url "https://github.com/BeamoINT/homebrew-tap/releases/download/bssh-v0.1.1/bssh-0.1.1.tar.gz"
  sha256 "304a459b5c2b623940f229c8c00b0bde92d5e7c4dc7ad92d168784c18fb773c1"
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
