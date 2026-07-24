# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/d4/25/6edffa0fc9d53a2dd20f7cd053024f6567a29592179ac82c69567638ab74/sibyl_dev-1.1.0.tar.gz"
  sha256 "ff19fa9a5157e38f0ced485b14809123a09ffaf70661d74abbcd8472a3f124a6"
  license "Apache-2.0"
  version "1.1.0"

  PYTHON_PACKAGE_VERSION = "1.1.0"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/78/96/090212251c8b7bee538a2e56ffce8ec7dd556da3d47579cb40589f124aaf/sibyl_core-1.1.0.tar.gz"
    sha256 "ccb1b991f2bc9af2dff4b0dd1c416bc35a1f24cd220a60a2e2068673464a1a9e"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/6d/c3/1fb897926e8932ee90a099efb949973b26ed3dc20ce1ef1c4a4830543105/sibyld-1.1.0.tar.gz"
    sha256 "54546c49559d7f5d2bdeb560262f890e185ef9249fbcd6dd1c7dba1dbb687042"
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
