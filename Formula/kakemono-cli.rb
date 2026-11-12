class KakemonoCli < Formula
  desc "Wallpaper manager CLI and headless daemon"
  homepage "https://github.com/RielJ/kakemono"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.0/kakemono-cli-macos-arm64.tar.gz"
      sha256 "08839c4402d65ef08661a77b92257183a3ff07ceb8f702ff50accc6076c3b36e"
    end
    on_intel do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.0/kakemono-cli-macos-x64.tar.gz"
      sha256 "19f9f4bc1816f5416bd52a1e74c4a2313d83cde840ca4d7b45d62c9abfef182c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.0/kakemono-cli-linux-arm64.tar.gz"
      sha256 "8e48764e1ddd570e847bb019b79eb8733230a6a1c25340119bf81eb940696990"
    end
    on_intel do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.0/kakemono-cli-linux-x64.tar.gz"
      sha256 "2f8119c759463f3742c7e9952cd92cfeb3c50e8feed30c26343a1dc785d7a063"
    end
  end

  # The kakemono cask links the same `kakemono` command. Casks can't name a conflicting
  # formula, so only this side says so.
  conflicts_with cask: "kakemono"

  def install
    bin.install "kakemono"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kakemono --version")
  end
end
