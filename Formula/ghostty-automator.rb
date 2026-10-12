class GhosttyAutomator < Formula
  desc "Ghostty with terminal automation for AI agents"
  homepage "https://github.com/hyperb1iss/ghostty-automator"
  version "1.3.1-auto.4"
  license "MIT"
  depends_on "libadwaita" => :linux

on_macos do
  if Hardware::CPU.arm?
    url "https://github.com/hyperb1iss/ghostty-automator/releases/download/v1.3.1-auto.4/ghostty-automator-macos-arm64.zip"
    sha256 "2ba1a308e0c48de6717fe88015793a67659bffc11c2fafeba3e7f5bd28a6fef9"
  end
end

on_linux do
  if Hardware::CPU.intel?
    url "https://github.com/hyperb1iss/ghostty-automator/releases/download/v1.3.1-auto.4/ghostty-automator-linux-amd64.tar.gz"
    sha256 "94d30d5e569ad29e35218a85deb213574e348afcdfd5f25f3830c1534020d765"
  end
end

on_linux do
  if Hardware::CPU.arm?
    url "https://github.com/hyperb1iss/ghostty-automator/releases/download/v1.3.1-auto.4/ghostty-automator-linux-arm64.tar.gz"
    sha256 "401ff98a944c705314ea03031494980af516045b38a90b68ed495cad0f176918"
  end
end

  def install
    libexec.install buildpath.children
    executable = OS.mac? ? libexec/"Ghostty.app/Contents/MacOS/ghostty" : libexec/"bin/ghostty-automator"
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
