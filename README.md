# 🏛️ Homebrew Formulae — Sirsi Tools

Official Homebrew tap for [Sirsi Technologies](https://github.com/SirsiMaster) tools.

## Installation

```bash
brew tap SirsiMaster/tools
brew install --cask sirsimaster/tools/sirsi-pantheon
```

The cask is the canonical Mac product. It installs `Pantheon.app` and exposes
the bundled `sirsi` CLI. Homebrew must never guess between a formula and cask:

```bash
brew upgrade --cask sirsimaster/tools/sirsi-pantheon
```

For a deliberately headless CLI/agent installation:

```bash
brew install --formula sirsimaster/tools/sirsi-pantheon-cli
brew upgrade --formula sirsimaster/tools/sirsi-pantheon-cli
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `sirsi-pantheon-cli` | Headless Pantheon CLI and agent; not the Mac application |
| `sirsi-anubis` | Infrastructure scanner and cleaner — standalone deity |
| `sirsi-guard` | System resource monitoring with accelerator detection — standalone deity |
| `sirsi-maat` | Quality assurance and audit engine — standalone deity |
| `sirsi-scarab` | Fleet sweep and network discovery — standalone deity |
| `sirsi-thoth` | AI project memory with context compression — standalone deity |

## Available Casks

```bash
brew install --cask sirsimaster/tools/sirsi-pantheon
```

| Cask | Description |
|------|-------------|
| `sirsi-pantheon` | DevOps intelligence platform — menu bar monitor + CLI (macOS `.app`) |

## About

This tap is automatically updated by [GoReleaser](https://goreleaser.com) when new versions of Sirsi tools are published.

---

*🏛️ One install. All deities. Nothing escapes the Weighing.*
