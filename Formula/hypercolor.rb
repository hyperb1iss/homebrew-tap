# typed: false
# frozen_string_literal: true

# Homebrew formula for Hypercolor.
#
# scripts/homebrew-formula.mjs renders this template on every stable tag:
# the Linux stanzas come from the public release, and the macOS stanzas are
# carried forward from the formula already published in the tap until the
# signed macOS lane promotes a newer accepted build.

class Hypercolor < Formula
  # Sequoia's symbolic version cannot distinguish 15.0 from the 15.2 floor.
  class MacosVersionRequirement < Requirement
    fatal true

    satisfy(build_env: false) do
      !OS.mac? || MacOS.version >= Version.new("15.2")
    end

    def message
      "Hypercolor requires macOS 15.2 or newer."
    end
  end

  desc "Open-source RGB lighting orchestration engine"
  homepage "https://github.com/hyperb1iss/hypercolor"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    version "0.3.2"
    depends_on macos: ">= :sequoia"
    depends_on MacosVersionRequirement

    if Hardware::CPU.arm?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-macos-arm64.tar.gz"
      sha256 "fab9e565fc5efa518cff23377883190e0a041d44454a0543e182e6133f3276f4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-linux-amd64.tar.gz"
      sha256 "5f4102f3ea07d2cd96d019bd431fbddd7d8155ebbee1cb623ae2bbfe010cfd75"
    elsif Hardware::CPU.arm?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-linux-arm64.tar.gz"
      sha256 "29f71b267e118e4d43f42952427f135159c86b0f6b954fdb6444840c0c143e2f"
    end
  end

  def install
    # Binaries
    %w[
      hypercolor-daemon
      hypercolor
      hypercolor-app
      hypercolor-tui
      hypercolor-open
    ].each do |b|
      bin.install "bin/#{b}" if File.exist?("bin/#{b}")
    end

    # Web UI, bundled effects, and shipped skills
    (share/"hypercolor").install "share/hypercolor/ui" if File.directory?("share/hypercolor/ui")
    (share/"hypercolor").install "share/hypercolor/effects" if File.directory?("share/hypercolor/effects")
    (share/"hypercolor").install "share/hypercolor/skills" if File.directory?("share/hypercolor/skills")

    # Shell completions
    bash_completion.install "share/bash-completion/completions/hypercolor" if File.exist?("share/bash-completion/completions/hypercolor")
    zsh_completion.install "share/zsh/site-functions/_hypercolor" if File.exist?("share/zsh/site-functions/_hypercolor")
    fish_completion.install "share/fish/vendor_completions.d/hypercolor.fish" if File.exist?("share/fish/vendor_completions.d/hypercolor.fish")
  end

  def caveats
    <<~EOS
      To start Hypercolor as a background service:
        brew services start hypercolor

      To open the web UI:
        hypercolor-open

      To launch the unified desktop app:
        hypercolor-app

      The daemon listens on http://127.0.0.1:9420 by default.
    EOS
  end

  # The daemon only accepts --macos-owner on macOS, and a launcher identity
  # naming the homebrew manager is only corroborated by launchd. On Linux the
  # systemd evidence resolves the identity on its own.
  on_macos do
    service do
      run [opt_bin/"hypercolor-daemon", "--macos-owner", "homebrew", "--ui-dir", share/"hypercolor/ui"]
      keep_alive successful_exit: false
      log_path var/"log/hypercolor/hypercolor.log"
      error_log_path var/"log/hypercolor/hypercolor.log"
      environment_variables HYPERCOLOR_LOG: "info", HYPERCOLOR_MACOS_OWNER: "homebrew", HYPERCOLOR_SERVICE_IDENTITY: "user_service:homebrew:homebrew.mxcl.hypercolor"
    end
  end

  on_linux do
    service do
      run [opt_bin/"hypercolor-daemon", "--ui-dir", share/"hypercolor/ui"]
      keep_alive successful_exit: false
      log_path var/"log/hypercolor/hypercolor.log"
      error_log_path var/"log/hypercolor/hypercolor.log"
      environment_variables HYPERCOLOR_LOG: "info"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypercolor --version")
    assert_match "Hypercolor lighting daemon", shell_output("#{bin}/hypercolor-daemon --help")
  end
end
