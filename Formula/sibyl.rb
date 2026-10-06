# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/23/a0/ddec6201d9d3621f1bf19f6a4f6de1c52504ec396d776b2a5c220559003c/sibyl_dev-1.4.4.tar.gz"
  sha256 "f894c2a6d340f4421a13e3c56f8b988757d6ecd90ebf33fd83b6e6e0d247d16a"
  license "Apache-2.0"
  version "1.4.4"

  PYTHON_PACKAGE_VERSION = "1.4.4"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/3a/70/738277933d69aad2f8152b50c78d7ca0846c26e0e6b7167133505b92c808/sibyl_core-1.4.4.tar.gz"
    sha256 "fb3a40eebe4b08e75f3894a4341cc8cf4d145b279bd239a168bd3cdd5405b4db"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/bb/f8/c06058e6f8941832f58f3931dbd2a5da1c02157d2eb4a3a5be7f2bff282f/sibyld-1.4.4.tar.gz"
    sha256 "165ce3cee14195ab519f4d7d5c649448e1a5eb8b9f396f0ad76e9a9df1b29e87"
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
