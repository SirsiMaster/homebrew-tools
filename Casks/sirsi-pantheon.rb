cask "sirsi-pantheon" do
  version "0.24.142"
  sha256 "a0819e79a14a43803064b17c5233e6e8cd34dc2774ee34e036137d0ba21fbab5"

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
