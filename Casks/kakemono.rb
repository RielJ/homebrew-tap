cask "kakemono" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "34be128db815ba73396f55ee2c3d3103dd8ebf138d1c13b5837f806ce2000545",
         intel: "0b7a01aee6bc6001b101cbef33c794fe19f31cb35babd8cd974cbaa0cd6a84bb"

  url "https://github.com/RielJ/kakemono/releases/download/v#{version}/kakemono-macos-#{arch}.dmg"
  name "kakemono"
  desc "Wallpaper manager with a tray app, a picker and many image sources"
  homepage "https://github.com/RielJ/kakemono"

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
