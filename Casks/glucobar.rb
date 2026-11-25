cask "glucobar" do
  version "0.4.0"
  sha256 "a81c422edd57cac17f7ae8a94a2bdc03e6110d73a58b79afaa1b62b8578240cc"

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


  uninstall quit: "dev.moti.glucobar"

  zap trash: "~/.config/glucobar"

  caveats <<~EOS
    GlucoBar is not a medical device. It uses an unofficial LibreLinkUp API that may stop
    working at any time, and it only alerts while your Mac is awake.
  EOS
end
