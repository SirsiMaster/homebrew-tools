cask "sirsi-pantheon" do
  version "0.24.138"
  sha256 "1d552c8f21ab1c24d2db6df4e44e71c865d2fdf9bfdbdd22d60f199925a8e9eb"

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
