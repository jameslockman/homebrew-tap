cask "griffin-powermate-agent" do
  version "1.0.10"
  sha256 "6c98d6856fef40b9f2dff5f6c0c9f131349b1859ffb68e54bdb4da7274d5e034"

  url "https://github.com/jameslockman/Griffin-PowerMate-Driver/releases/download/#{version}/PowerMateAgent-#{version}.dmg"
  name "PowerMate Agent"
  desc "Driver for the Griffin PowerMate USB controller on modern macOS"
  homepage "https://github.com/jameslockman/Griffin-PowerMate-Driver"

  depends_on macos: ">= :ventura"

  app "PowerMate Agent.app"

  zap trash: [
    "~/Library/Application Support/PowerMateAgent",
    "~/Library/Preferences/com.jameslockman.PowerMateAgent.plist",
    "~/Library/Logs/PowerMateAgent",
  ]
end
