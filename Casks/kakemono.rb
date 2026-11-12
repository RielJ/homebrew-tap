cask "kakemono" do
  arch arm: "arm64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "dc9cb3981a88688a1d375cf2972bf8af5ff9c9c3f21b5b091607b72091580e85",
         intel: "f23f8f2c4887841e161a1104ebd54dde6e32a03f476d7b12d8efbfba0ff5ccb0"

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
