class GhosttyAutomator < Formula
  desc "Ghostty with terminal automation for AI agents"
  homepage "https://github.com/hyperb1iss/ghostty-automator"
  version "1.3.1-auto.3"
  license "MIT"
  depends_on "libadwaita" => :linux

on_macos do
  if Hardware::CPU.arm?
    url "https://github.com/hyperb1iss/ghostty-automator/releases/download/v1.3.1-auto.3/ghostty-automator-macos-arm64.zip"
    sha256 "b620e77e827c5fdbe894b471ed6c2b47722cb3e5735d5571896c19a09755fb19"
  end
end

on_linux do
  if Hardware::CPU.intel?
    url "https://github.com/hyperb1iss/ghostty-automator/releases/download/v1.3.1-auto.3/ghostty-automator-linux-amd64.tar.gz"
    sha256 "8a14bd92d8bd9f4f61fc3abb6abb56888f3663adbb6b255f95a2dee89daa864b"
  end
end

on_linux do
  if Hardware::CPU.arm?
    url "https://github.com/hyperb1iss/ghostty-automator/releases/download/v1.3.1-auto.3/ghostty-automator-linux-arm64.tar.gz"
    sha256 "5dc422e441a61aade079a88d5ac2bc429ebbaba80f09e5561d96977e857a6e18"
  end
end

  def install
    libexec.install buildpath.children
    executable = OS.mac? ? libexec/"Ghostty.app/Contents/MacOS/Ghostty" : libexec/"bin/ghostty-automator"
    resources = OS.mac? ? "unset GHOSTTY_RESOURCES_DIR" : "export GHOSTTY_RESOURCES_DIR=\"#{libexec}/share/ghostty\""
    libraries = OS.mac? ? "" : "export LD_LIBRARY_PATH=\"#{libexec}/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}\""
    (bin/"ghostty-automator").write <<~EOS
      #!/usr/bin/env bash
      #{resources}
      #{libraries}
      export GHOSTTY_AUTOMATOR_SKILLS_DIR="#{libexec}/skills"
      export GHOSTTY_AUTOMATOR_LAUNCHER="#{bin}/ghostty-automator"
      exec "#{executable}" "$@"
    EOS
    (bin/"ghostty-automator").chmod 0755
  end

  def caveats
    <<~EOS
      Agent skill: #{libexec}/skills/ghostty-terminal-automation
      Run ghostty-automator +doctor, then ghostty-automator +bootstrap.
      Linux releases require GTK 4.14+ and libadwaita 1.5+ from the host.
    EOS
  end

  test do
    system bin/"ghostty-automator", "+version"
  end
end
