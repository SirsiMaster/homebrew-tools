# Pantheon Homebrew Package Contract

- `brew install --cask sirsimaster/tools/sirsi-pantheon` installs the complete
  Mac application and exposes its bundled `sirsi` CLI. This is the canonical
  macOS product path.
- `brew install sirsimaster/tools/sirsi-pantheon-cli` installs only the headless
  CLI and agent. It is intended for automation or non-GUI systems.
- The same token is never published as both a formula and a cask.
- GUI lifecycle registration is consented through
  `sirsi surface install gui`; package installation never manually calls the
  deprecated `launchctl load` path.
- Upgrade commands must include `--cask` for the app or the `-cli` suffix for
  the formula, so Homebrew never guesses.
