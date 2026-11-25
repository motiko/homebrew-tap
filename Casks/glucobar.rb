cask "glucobar" do
  version "0.4.1"
  sha256 "2d489b82107fd933773faa3bbe72f37ff30b0e96750b1aa2797f485d912cd584"

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
