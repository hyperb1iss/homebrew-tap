class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "fe6a97d4d5ee9e69572b1dacd0c0b15e6f5eafdfe7b9fa3825b6e9cab3c2ca6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "c3f9eacf4575261c33e079f9e12df80f50ed6a1b3e77ebee3eb11e8632a30be8"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "5792e856072e33f2234b0d107780645ccbfa18b70c0fcfc657c49b38f4f8ac89"
    end
  end

  def install
    bin.install Dir["unifly*"].first => "unifly"
  end

  test do
    assert_match "unifly #{version}", shell_output("#{bin}/unifly --version")
  end
end
