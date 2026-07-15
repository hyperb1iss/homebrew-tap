# typed: false
# frozen_string_literal: true

# Homebrew formula for Hypercolor
# Auto-updated by CI — do not edit SHA256 sums manually.

class Hypercolor < Formula
  desc "Open-source RGB lighting orchestration engine"
  homepage "https://github.com/hyperb1iss/hypercolor"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-macos-arm64.tar.gz"
      sha256 "de390d0f0b0756aef15e80940698c6954171843d9b5e39afe626b5d9b2ee13d6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-linux-amd64.tar.gz"
      sha256 "6386383ec769c85f3463d269d2259283c03a27eb072ac400d733575e6b3f46da"
    elsif Hardware::CPU.arm?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-linux-arm64.tar.gz"
      sha256 "355e8da4e69e5513a500e916af2ed080400f92c57e35e6882955161fe20e3df6"
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
