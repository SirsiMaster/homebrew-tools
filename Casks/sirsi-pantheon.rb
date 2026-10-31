cask "sirsi-pantheon" do
  version "0.24.154"
  sha256 "01a63f2c78655062f5fd9c5a9860d48342831246963294f46125e652c0a8f5cd"

  depends_on arch: :arm64
  depends_on macos: :ventura

  url "https://github.com/SirsiMaster/sirsi-pantheon/releases/download/v#{version}/SirsiPantheon-#{version}-arm64.dmg"
  name "Sirsi Pantheon"
  desc "DevOps intelligence platform — menu bar monitor + CLI"
  homepage "https://github.com/SirsiMaster/sirsi-pantheon"

  app "Pantheon.app"
  binary "#{appdir}/Pantheon.app/Contents/MacOS/sirsi", target: "sirsi"

  uninstall quit:      "ai.sirsi.pantheon",
            launchctl: "ai.sirsi.pantheon"

  zap trash: [
    "~/.config/pantheon",
    "~/Library/LaunchAgents/ai.sirsi.pantheon.plist",
  ]

  caveats <<~EOS
    Pantheon.app includes both the menu bar monitor and the sirsi CLI.

    To start the menu bar at login:
      cp /Applications/Pantheon.app/Contents/Resources/ai.sirsi.pantheon.plist ~/Library/LaunchAgents/
      launchctl load ~/Library/LaunchAgents/ai.sirsi.pantheon.plist

    Quick start:
      sirsi scan       Find waste on your machine
      sirsi doctor     Check system health
      sirsi ghosts     Find remnants of uninstalled apps
  EOS
end
