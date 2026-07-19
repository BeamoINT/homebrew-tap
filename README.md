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

Install [Beamo Flasher](https://github.com/BeamoINT/beamo-flasher) with:

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
