cask "griffin-powermate-agent" do
  version "1.0.11"
  sha256 "325dca8e58172a1ad8a0fa5b8307679301937587923d2dc67ee5e7d1fa187dbf"

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
                   
  zap trash: [
    "~/Library/Application Support/PowerMateAgent",
    "~/Library/Logs/PowerMateAgent",
    "~/Library/Preferences/com.jameslockman.PowerMateAgent.plist",
  ]
end
