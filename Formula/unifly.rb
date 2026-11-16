class Unifly < Formula
  desc "CLI + TUI for managing UniFi network controllers"
  homepage "https://github.com/hyperb1iss/unifly"
  license "Apache-2.0"
  version "0.14.0"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-macos-arm64"
      sha256 "17cd88bb416815d04be6b3cdf938d75642c7fcfd37c7506fb089959aae3e67a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-arm64"
      sha256 "628ee95794d7d836237c280c110dfe8993c35e56e7a3c3a91695a11dbfcce974"
    end
    on_intel do
      url "https://github.com/hyperb1iss/unifly/releases/download/v#{version}/unifly-linux-amd64"
      sha256 "6746d9d15ef6f3d3f951a9a7306cff03c761f88b425b95f502c6e87d3d3e1718"
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
