# typed: false
# frozen_string_literal: true

class GitIris < Formula
  desc "An intelligent agent that understands your code and crafts perfect Git artifacts"
  homepage "https://github.com/hyperb1iss/git-iris"
  license "Apache-2.0"
  version "2.0.3"

  on_macos do
    on_arm do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-macos-arm64"
      sha256 "7e40ebb811d89a92afe739eaff3c9ce7900a38c39ba0955e1fa9732ab2fcb0f1"
    end
    on_intel do
      url "https://github.com/hyperb1iss/git-iris/archive/refs/tags/v#{version}.tar.gz"
      sha256 "77ce7fc00ea8a5dd7cea15041c93716140b79931e68405e4c7e621f692d24122"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-linux-arm64"
      sha256 "646f01998673c4e81a5b977d25364c14c2ed7e759c58af63ae739d74f240df65"
    end
    on_intel do
      url "https://github.com/hyperb1iss/git-iris/releases/download/v#{version}/git-iris-linux-amd64"
      sha256 "e99045436c3855ad4c6101f2c89d558163031da35f4c408bbca3fb0b2285b5f2"
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
