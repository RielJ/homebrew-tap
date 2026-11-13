class KakemonoCli < Formula
  desc "Wallpaper manager CLI and headless daemon"
  homepage "https://kakemono.rielj.xyz"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.2/kakemono-cli-macos-arm64.tar.gz"
      sha256 "ff630181168d242053c5cc468cc2930c34d88ae55351fe7cc761f81b6527241d"
    end
    on_intel do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.2/kakemono-cli-macos-x64.tar.gz"
      sha256 "1cc483a2c6361eae9c6fd3cc3aca5a3f02e9d8c1ad8becec03c62ecc35d377f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.2/kakemono-cli-linux-arm64.tar.gz"
      sha256 "d40af1021f119bf1f72d3da310a101cbebc6b0cd315948f655db7fc7823893cd"
    end
    on_intel do
      url "https://github.com/RielJ/kakemono/releases/download/v0.3.2/kakemono-cli-linux-x64.tar.gz"
      sha256 "d53ab0f9041e20b01dd37d11989f19961183a2c3d59cf4ee4688f47872bd962e"
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
