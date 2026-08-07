class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "a3017cfed6817d803021b3c1bcdbe49e310bef68e260ebf36f5a8ece60cd8dd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "a3b7d5a27964273d0bf09a25a9badc1593b4d3c3246d0c5c9e4453e24f40664a"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "d2160a06fafc104f5122719daf5ed38ee2ee28bab7c7778f7776994c01a15424"
    end
  end

  def install
    bin.install Dir["unifly*"].first => "unifly"
  end

  test do
    assert_match "unifly #{version}", shell_output("#{bin}/unifly --version")
  end
end
