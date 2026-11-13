cask "kakemono" do
  arch arm: "arm64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "4bd36dfcc38fabde84938583aaca96e3aef3dbd8b61ebbd230c30e3981e444c2",
         intel: "bd1e16b087920cdde292ec841927d1efaef9848e1488602a10e9dbd0a17b1132"

  url "https://github.com/RielJ/kakemono/releases/download/v#{version}/kakemono-macos-#{arch}.dmg"
  name "kakemono"
  desc "Wallpaper manager with a tray app, a picker and many image sources"
  homepage "https://kakemono.rielj.xyz"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself from Settings.
  auto_updates true
  depends_on :macos

  app "kakemono.app"
  binary "#{appdir}/kakemono.app/Contents/MacOS/kakemono"

  # The app is not notarized. Homebrew quarantines what it downloads, and Gatekeeper then calls
  # the app "damaged"; clearing the flag here saves the user the `xattr` step.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/kakemono.app"],
        writable_paths: ["{{appdir}}/kakemono.app"]
  end

  uninstall launchctl: "dev.rielj.kakemono.daemon",
            quit:      "dev.rielj.kakemono"

  zap trash: [
    "~/.cache/kakemono",
    "~/.config/kakemono",
    "~/.local/state/kakemono",
    "~/Library/LaunchAgents/dev.rielj.kakemono.daemon.plist",
  ]
end
