class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "f90aee9645b9dbeae0ed1e74cdea0ad23fae449fc427390b789915587237e848"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "ab8443085546be32b406195ab2771bdebb2c24f323f79cc4358310fde347d18a"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "fbbed8c37344b29c56fc7cf30cfbe77e276abc4622986bdf3c90c0391a05cfc4"
    end
  end

  def install
    bin.install Dir["unifly*"].first => "unifly"
  end

  test do
    assert_match "unifly #{version}", shell_output("#{bin}/unifly --version")
  end
end
