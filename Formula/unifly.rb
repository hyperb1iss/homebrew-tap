class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "d67f22870baf514284dd0c820fc6ebbab472edffbd0f0eff5181b18b9788cfb6"

      resource "unifly-tui" do
        url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-tui-macos-arm64"
        sha256 "ade5663089e27ef078541a730ff0d7d4a8d6a3c53c9aaa19be9f04e022287219"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "9627cde2b0b6e20fd86d75565913145746e655ac17184efb8c97a5ae8a74c657"

      resource "unifly-tui" do
        url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-tui-linux-arm64"
        sha256 "c41c9f7c9ed3c19c1fc03b65d65e7e61c4233f57e02a9d32dee07254768c6137"
      end
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "d3345564ccba61ab47bf24bded7162c06e9e3b4de7491abcf9111323c6621739"

      resource "unifly-tui" do
        url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-tui-linux-amd64"
        sha256 "6429b0d6fcf1afd361470233315e9558182cb33f5195ab7e84cb5d4056e541a8"
      end
    end
  end

  def install
    bin.install Dir["unifly*"].first => "unifly"
    resource("unifly-tui").stage do
      bin.install Dir["unifly-tui*"].first => "unifly-tui"
    end
  end

  test do
    assert_match "unifly #{version}", shell_output("#{bin}/unifly --version")
    assert_match "unifly-tui #{version}", shell_output("#{bin}/unifly-tui --version")
  end
end
