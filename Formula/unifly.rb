class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "d1e166a3b287e0519db6e78874eef9375629198259d8319884254bf6c8d340b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "2c1ce5665ec1b5785a9c1ef8e7e745036cdabed053dadad6e4cb7fca737a58a1"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "01f998db84c3ba66333f4eb069e917669a0b028b5ed0699875d4e4998b3b7e38"
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
