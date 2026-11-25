cask "glucobar" do
  version "0.3.0"
  sha256 "425f7ee854ec3ce59099939fce93be2b1e27d3b84d5aaf8c8087e86fe8d64c18"

  url "https://github.com/motiko/glucobar/releases/download/v#{version}/GlucoBar-#{version}.zip"
  name "GlucoBar"
  desc "Menu bar app showing your current glucose from LibreLinkUp"
  homepage "https://github.com/motiko/glucobar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "GlucoBar.app"

  # Not notarized: clear the quarantine flag (while the app is still staged) so Gatekeeper
  # doesn't block it after every install/upgrade. Removed once releases use Developer ID.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "GlucoBar.app"],
                          chdir: ".", writable_paths: ["GlucoBar.app"]
  end

  uninstall quit: "dev.moti.glucobar"

  zap trash: "~/.config/glucobar"

  caveats <<~EOS
    GlucoBar is not a medical device. It uses an unofficial LibreLinkUp API that may stop
    working at any time, and it only alerts while your Mac is awake.
  EOS
end
