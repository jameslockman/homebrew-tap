cask "griffin-powermate-agent" do
  version "1.0.13"
  sha256 "39599514f73a8a80063cf9793f04d407faee4f4bdd5df8606e2b626a783f4a1c"

  url "https://github.com/jameslockman/Griffin-PowerMate-Driver/releases/download/#{version}/PowerMateAgent-#{version}.dmg"
  name "PowerMate Agent"
  desc "Driver for the Griffin PowerMate USB controller on modern Macs"
  homepage "https://github.com/jameslockman/Griffin-PowerMate-Driver"

  depends_on macos: :ventura

  app "PowerMate Agent.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PowerMate Agent.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/PowerMateAgent",
    "~/Library/Logs/PowerMateAgent",
    "~/Library/Preferences/com.jameslockman.PowerMateAgent.plist",
  ]
end
