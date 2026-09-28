cask "griffin-powermate-agent" do
  version "1.0.20"
  sha256 "c170a3d134cafced767c5d8e60e71eddf699b31f5363967b232288aa8ac25bf6"

  url "https://github.com/jameslockman/Griffin-PowerMate-Driver/releases/download/#{version}/PowerMateAgent-#{version}.dmg"
  name "PowerMate Agent"
  desc "Driver for the Griffin PowerMate USB controller on modern Macs"
  homepage "https://github.com/jameslockman/Griffin-PowerMate-Driver"

  depends_on macos: :ventura

  app "PowerMate Agent.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/PowerMate Agent.app"],
        sudo: false
  end

  zap trash: [
    "~/Library/Application Support/PowerMateAgent",
    "~/Library/Logs/PowerMateAgent",
    "~/Library/Preferences/com.jameslockman.PowerMateAgent.plist",
  ]
end
