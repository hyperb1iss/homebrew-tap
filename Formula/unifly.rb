class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.12.1"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "3d7f61e7799356ad8abf502288187629b7216297979664c19f9c8fd0aa10cb34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "189ff60cd57f59285ab471876b8d70aae1d98e4885f67090d8ffbb667764690d"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "0e7278994cfee7b94dfe0849a5cbeb68f3db4bd7bbeae54537723a6d07d7c2fd"
    end
  end

  def install
    bin.install Dir["unifly*"].first => "unifly"
  end

  # Homebrew installs for every user, and macOS sandboxes
  # post_install away from home directories, so each user adds the
  # agent skill themselves.
  def caveats
    <<~EOS
      unifly ships an agent skill so coding agents can find it.
      Install it into ~/.agents/skills for your user with:
        unifly skill --install
      Add --claude to install it into Claude Code's skills directory instead.
    EOS
  end

  test do
    assert_match "unifly #{version}", shell_output("#{bin}/unifly --version")
    system bin/"unifly", "skill", "--install", "--dir", testpath/"skills"
    assert_path_exists testpath/"skills/unifly/SKILL.md"
  end
end
