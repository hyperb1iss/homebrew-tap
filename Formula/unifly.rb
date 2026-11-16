class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.15.0"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "cd6c7500406b6167c65cda9dacc4678c17cdad53f5cd764ce1867e612bfdc71b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "5ba533deb1e3f9e660dbe0543fc8d4d1f4fbaf5a193284b79e6228a7cb03c731"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "499c37fec104f906433859bddeb86c1674f89a054a00ca28c5de4371f28f5e54"
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
