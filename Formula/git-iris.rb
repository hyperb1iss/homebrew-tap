# typed: false
# frozen_string_literal: true

class GitIris < Formula
  desc "An intelligent agent that understands your code and crafts perfect Git artifacts"
  homepage "https://github.com/hyperb1iss/git-iris"
  license "Apache-2.0"
  version "2.0.4"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-macos-arm64"
      sha256 "06fd74d35487dce6f698030ac6bd2c9c5803cae21c44f6e46a2f68f959c706a5"
    end
    on_intel do
      url "https://github.com/hyperb1iss/git-iris/archive/refs/tags/v#{version}.tar.gz"
      sha256 "8cca2a4c96f73aa10d2d315f371d550feae25d6895185e1e61170d804d7d5e88"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-linux-arm64"
      sha256 "f5d0140bfb6612ec931a98a8cbdefcf0663a10c507a4491f25fc14903c3dcd41"
    end
    on_intel do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-linux-amd64"
      sha256 "2026b72c8ced9411414093146758048823a7b4352cc3132f590383eae361dfd7"
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
