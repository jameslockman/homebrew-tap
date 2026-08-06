cask "griffin-powermate-agent" do
  version "1.0.19"
  sha256 "0719e28cdeafae8ba8f184ca8d5940139664b8313471fcc2a3a18a384aec4c55"

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
