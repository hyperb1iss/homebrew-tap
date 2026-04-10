class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "9e8c4491561e68e596c50118a5f9baa89d69f64029a8dc821bf4fc84950ff5eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "894b4f72b3fb1c97a579c7ed2a83506eeeccd1295ceb4a613e8f7d3cb64dedcf"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "f8e9b2bd9a7b372874b7e9ac32c13b5b49f9fa724dbff8966d01cf1d3aaf4613"
    end
  end

  def install
    bin.install Dir["unifly*"].first => "unifly"
  end

  test do
    assert_match "unifly #{version}", shell_output("#{bin}/unifly --version")
  end
end
