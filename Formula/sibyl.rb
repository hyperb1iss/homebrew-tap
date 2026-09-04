# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/bb/6a/5e928a850080e8757af966199049d33b36edc5974be18a17d045b66dc560/sibyl_dev-1.3.2.tar.gz"
  sha256 "919e2f16eea39b5babcf3720714b42b79d08d1f49b59da1283d77abc3d0b0dd4"
  license "Apache-2.0"
  version "1.3.2"

  PYTHON_PACKAGE_VERSION = "1.3.2"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/b5/57/cfdda599e13e84fef10c680a19c6dc3bf17a61cb8676d9b856f8b7a4a20b/sibyl_core-1.3.2.tar.gz"
    sha256 "68f4b6a3ebcef630a7c9e3d1c8b18ad2eeb655444b7048ed605f58bc27e735db"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/c9/0f/7dd320aa96af58c500b09c987f96f4ef9bff64e50009bb7450761c1c0920/sibyld-1.3.2.tar.gz"
    sha256 "b5c188c8d3ecfb5dd1106ce01eef393c4e39e55df3407847d0d68579530f09fe"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")

    resource("sibyl-core").stage do
      venv.pip_install Pathname.pwd
    end

    resource("sibyld").stage do
      venv.pip_install Pathname.pwd
    end

    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/sibyl"
    bin.install_symlink libexec/"bin/sibyld"
  end

  test do
    assert_match PYTHON_PACKAGE_VERSION, shell_output("#{bin}/sibyl --version")
    assert_match PYTHON_PACKAGE_VERSION, shell_output("#{bin}/sibyld --version")
  end
end
