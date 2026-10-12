class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "101d7d6f55cd02bc813d0ec76980f7856411fa8836bc403d4d063f76852812c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "8beedf0f338e9aa34ec40a375093f8568da4e863559c66ce4da593bfb34cdb05"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "df67dc26ef16dd96a6c474d8e7da4e2c4dc7ddc9352e4884641ee70344f21bca"
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
