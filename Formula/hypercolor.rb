# typed: false
# frozen_string_literal: true

# Homebrew formula for Hypercolor
# Auto-updated by CI — do not edit SHA256 sums manually.

class Hypercolor < Formula
  desc "Open-source RGB lighting orchestration engine"
  homepage "https://github.com/hyperb1iss/hypercolor"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-macos-arm64.tar.gz"
      sha256 "130bd636bf10a38432a88193965f31ba20cb234128dff2c1e086df4afae771ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-linux-amd64.tar.gz"
      sha256 "239c1319f7eaa967197b938b4c43473ceccde0cfb21e0a932da2778748e59f92"
    elsif Hardware::CPU.arm?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-linux-arm64.tar.gz"
      sha256 "4ea15d163c3baf5e2395bff9fa04b52ee1211410cb6fed217988fc859039012f"
    end
  end

  def install
    # Binaries
    %w[
      hypercolor-daemon
      hypercolor
      hypercolor-app
      hypercolor-tray
      hypercolor-tui
      hypercolor-open
    ].each do |b|
      bin.install "bin/#{b}" if File.exist?("bin/#{b}")
    end

    # Web UI + bundled effects
    (share/"hypercolor").install "share/hypercolor/ui" if File.directory?("share/hypercolor/ui")
    (share/"hypercolor").install "share/hypercolor/effects" if File.directory?("share/hypercolor/effects")

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

  service do
    run [opt_bin/"hypercolor-daemon", "--ui-dir", share/"hypercolor/ui"]
    keep_alive true
    log_path var/"log/hypercolor/hypercolor.log"
    error_log_path var/"log/hypercolor/hypercolor.log"
    environment_variables HYPERCOLOR_LOG: "info"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypercolor --version")
    assert_match "Hypercolor lighting daemon", shell_output("#{bin}/hypercolor-daemon --help")
  end
end
