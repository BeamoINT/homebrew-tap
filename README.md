# BeamoINT Homebrew tap

Install [Claudex](https://github.com/BeamoINT/Claudex) with:

```sh
brew install BeamoINT/tap/claudex
claudex --login
```

Claudex's automatic first-run setup installs Codex and Claude Code when they
are missing. The formula installs the Node.js and jq runtime dependencies used
by that setup.

## Beamo Flasher CLI

Install [Beamo Flasher](https://beamo.tech/flasher-download) with:

```sh
brew install BeamoINT/tap/beamo-flasher
bflash --help
```

## Browser SSH CLI

Install [bssh](https://browserssh.com) with:

```sh
brew install BeamoINT/tap/bssh
bssh --help
```

`bssh` is the first-party CLI for the Browser SSH agent API and MCP install glue.
It is a self-contained Node bundle (requires `node`) shipped as a GitHub Release
asset on this tap; it is not published to npm.

## AgentSSH

Install [AgentSSH](https://agentssh-beamo-20260920.pages.dev), the independent agent SSH API and MCP client:

```sh
brew install BeamoINT/tap/agentssh
agentssh --help
```

On Windows, add this repository as a Scoop bucket and run `scoop install agentssh`.
The [AgentSSH release](https://github.com/BeamoINT/homebrew-tap/releases/tag/agentssh-v0.1.1) also includes standalone TypeScript and Python SDK packages, Terraform provider binaries, and the connector Helm chart. SHA256SUMS covers every downloadable archive.
