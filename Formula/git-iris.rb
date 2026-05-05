# typed: false
# frozen_string_literal: true

class GitIris < Formula
  desc "An intelligent agent that understands your code and crafts perfect Git artifacts"
  homepage "https://github.com/hyperb1iss/git-iris"
  license "Apache-2.0"
  version "2.0.9"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-macos-arm64"
      sha256 "0e497e1208c55e9410a16b81ec1ce09395ecee68a266013fc5e0e3e4b53f32b2"
    end
    on_intel do
      url "https://github.com/hyperb1iss/git-iris/archive/refs/tags/v#{version}.tar.gz"
      sha256 "3fdb00ad376f0063f6dfa0f7ed2fb5fefe8e62e1f284de3aabe6a939889f1382"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-linux-arm64"
      sha256 "4136e2e0a884acf0dadf8b8573f1f31a9e1d5236f952f75580d931d5be38b877"
    end
    on_intel do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-linux-amd64"
      sha256 "6848ff28c223431fc8f13b073ce3688e099c11a1ad4e9c471b2a6f2ad03560c1"
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
