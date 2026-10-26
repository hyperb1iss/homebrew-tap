# typed: false
# frozen_string_literal: true

# Homebrew formula for Hypercolor.
#
# scripts/homebrew-formula.mjs renders Linux from every stable release. macOS
# comes from the same release when its notarized build shipped; otherwise the
# macOS stanza is carried forward from the formula already in the tap, which
# may be a withdrawn stanza that refuses macOS until a notarized build ships.

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

  # Only a withdrawn macOS stanza depends on this, so a macOS install fails
  # with a reason instead of resolving an older build.
  class NotarizedMacosBuildRequirement < Requirement
    fatal true

    satisfy(build_env: false) do
      !OS.mac?
    end

    def message
      "Hypercolor's macOS build is waiting on Apple notarization, so this release " \
        "installs on Linux only. If an older build is installed, remove it with " \
        "`brew uninstall hypercolor`."
    end
  end

  desc "Open-source RGB lighting orchestration engine"
  homepage "https://github.com/hyperb1iss/hypercolor"
  version "0.8.0"
  license "Apache-2.0"

  # macOS releases ship for Apple silicon only, so Homebrew refuses Intel
  # Macs up front instead of fetching an archive that does not exist.
  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    depends_on MacosVersionRequirement

    url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-macos-arm64.tar.gz"
    sha256 "b73780335db26853656120a430b9ba32b80bd7879b6e06400744962c70cb8019"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-linux-amd64.tar.gz"
      sha256 "80943d719943eccf72a7bfd8bd155cef3327db5234a414346724fed263bb1d85"
    elsif Hardware::CPU.arm?
      url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/hypercolor-#{version}-linux-arm64.tar.gz"
      sha256 "0322124c4ae4d94a29f24da07d4fcd790c202d21a50481fcbf9388a6466e1d54"
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
      run [opt_bin/"hypercolor-daemon", "--macos-owner", "homebrew", "--ui-dir", opt_pkgshare/"ui"]
      keep_alive successful_exit: false
      log_path var/"log/hypercolor/hypercolor.log"
      error_log_path var/"log/hypercolor/hypercolor.log"
      environment_variables HYPERCOLOR_LOG: "info", HYPERCOLOR_MACOS_OWNER: "homebrew", HYPERCOLOR_SERVICE_IDENTITY: "user_service:homebrew:homebrew.mxcl.hypercolor"
    end
  end

  on_linux do
    service do
      run [opt_bin/"hypercolor-daemon", "--ui-dir", opt_pkgshare/"ui"]
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
