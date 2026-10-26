# frozen_string_literal: true

# Homebrew cask for the Hypercolor desktop app.
# Updated by CI from signed and notarized release artifacts.

cask "hypercolor-app" do
  version "0.8.0"
  sha256 "7ca0c089b52ef7f6d82774f66fd57d1cc5ffab761cf4eb425356a5e446f4192a"

  url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/Hypercolor-#{version}-arm64.dmg",
      verified: "github.com/hyperb1iss/hypercolor/"
  name "Hypercolor"
  desc "Open-source RGB lighting orchestration"
  homepage "https://github.com/hyperb1iss/hypercolor"

  # Apple silicon only; Homebrew refuses the cask on Intel Macs.
  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "Hypercolor.app"

  preflight do
    if MacOS.version < Version.new("15.2")
      raise ::Cask::CaskError, "Hypercolor requires macOS 15.2 or newer."
    end
  end

  zap trash: [
    "~/Library/Application Support/hypercolor",
    "~/Library/Caches/hypercolor",
    "~/Library/Logs/Hypercolor",
    "~/Library/LaunchAgents/Hypercolor.plist",
  ]
end
