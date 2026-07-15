# frozen_string_literal: true

# Homebrew cask for the Hypercolor desktop app.
# Auto-updated by CI — do not edit SHA256 sums manually.

cask "hypercolor-app" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1"
  sha256 arm:   "87a849e626db95c7a58eb85758671e4ee247a857254ed594fe2798f10071d4e7",
         intel: "21cb699f196b8139bd2c1010cab1e414c351263d1dc15dcf92ff3e0dc5c5f5a2"

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
