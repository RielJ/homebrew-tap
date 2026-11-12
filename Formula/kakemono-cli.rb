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
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.1/kakemono-cli-macos-arm64.tar.gz"
      sha256 "87c072809cb0277674a47ce403cc2ca7bfb49ae43a8a10bbd313cd55e39a3f4d"
    end
    on_intel do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.1/kakemono-cli-macos-x64.tar.gz"
      sha256 "2f5ce85b7b3598f4089e4f67280fd905f14b6c6c07d8b7433c244fbff97a969a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.1/kakemono-cli-linux-arm64.tar.gz"
      sha256 "eb7b33740d6ccbbb3c9931e4413e21711eb7931c21dc607526f174e56d8c300d"
    end
    on_intel do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.1/kakemono-cli-linux-x64.tar.gz"
      sha256 "e862073e1577cc64f3ecfba972d022227e313eb3c1bb82a6b70dda582d391368"
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
