class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.8.2"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "25c55fcb8bff806d6706eb004b8ced591940169a2732437126dc269f4caede81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "bcc181ff460931b56e532f331d64122e5057abbcf859a4586c1ffba2054df8ef"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "220b93fdd74df2498f352e427914bd1b5293b31af4a5a41575281db4bfc23784"
    end
  end

  def install
    bin.install Dir["unifly*"].first => "unifly"
  end

  test do
    assert_match "unifly #{version}", shell_output("#{bin}/unifly --version")
  end
end
