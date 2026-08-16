# frozen_string_literal: true

# Homebrew cask for the Hypercolor desktop app.
# Auto-updated by CI — do not edit SHA256 sums manually.

cask "hypercolor-app" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2"
  sha256 arm:   "63d99937211948c962862d7581be01d8f452042c9e616b4bb2a0311038a270d3",
         intel: "524cb52a00cd45641ec002e06e45289e863991963b8e4e9b52bf9f2de70fa806"

  url "https://github.com/hyperb1iss/hypercolor/releases/download/v#{version}/Hypercolor-#{version}-#{arch}.dmg",
      verified: "github.com/hyperb1iss/hypercolor/"
  name "Hypercolor"
  desc "Open-source RGB lighting orchestration"
  homepage "https://github.com/hyperb1iss/hypercolor"

  app "Hypercolor.app"

  zap trash: [
    "~/Library/Application Support/hypercolor",
    "~/Library/Caches/hypercolor",
    "~/Library/Logs/Hypercolor",
    "~/Library/LaunchAgents/tech.hyperbliss.hypercolor.app.plist",
  ]
end
