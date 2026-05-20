# typed: false
# frozen_string_literal: true

class GitIris < Formula
  desc "An intelligent agent that understands your code and crafts perfect Git artifacts"
  homepage "https://github.com/hyperb1iss/git-iris"
  license "Apache-2.0"
  version "2.1.0"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-macos-arm64"
      sha256 "d64d63c88cfb0bb5b966f67c388cc3532a109f18bfb968731b0fb2cf14424a0c"
    end
    on_intel do
      url "https://github.com/hyperb1iss/git-iris/archive/refs/tags/v#{version}.tar.gz"
      sha256 "cc2bd3cf67ec5ae7d6fc4f9199c8ad9b9cbbbcbb86e79d1476835cd41a71e080"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-linux-arm64"
      sha256 "2baf8b830bb2aa347d371b0b987ea58666c18da3543fffbc56ad629e765228f7"
    end
    on_intel do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-linux-amd64"
      sha256 "e3096dac3d08a2d90247829ee40682119ee332053c496b9ab3f7fba18ffc214f"
    end
  end

  def install
    if build.with?("rust")
      system "cargo", "install", *std_cargo_args
    else
      bin.install Dir["git-iris*"].first => "git-iris"
    end
  end

  test do
    assert_match "git-iris #{version}", shell_output("#{bin}/git-iris --version")
  end
end
