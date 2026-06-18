cask "griffin-powermate-agent" do
  version "1.0.15"
  sha256 "a31ccf7d97641e0a77462148a428c28a375f070a44aaceb3b945b23245890dd6"

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
