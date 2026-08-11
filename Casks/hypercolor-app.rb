# frozen_string_literal: true

# Homebrew cask for the Hypercolor desktop app.
# Auto-updated by CI — do not edit SHA256 sums manually.

cask "hypercolor-app" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1"
  sha256 arm:   "0e5183291f6b10f97eb1e03f1187ad98df3ce7d40eb84e8e4ffb4c8475cbd7e7",
         intel: "34cd8d2bbc6aa67bbf497d068a508b9306e76b376feb25e9d7664fc97cb00e04"

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
