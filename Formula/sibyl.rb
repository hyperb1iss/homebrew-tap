# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/14/65/2bb64323ef20bf7e0408b10076248374f28c1981545f5e5a1a412af87409/sibyl_dev-1.0.0.tar.gz"
  sha256 "9f1636c666636cb39f05ccb61a0f4b4d5b6cf40d14a2881225c928b25d08412e"
  license "Apache-2.0"
  version "1.0.0"

  PYTHON_PACKAGE_VERSION = "1.0.0"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/5a/1f/c165beaf68a5fcfa70d00b6927795e168fe953e9e9d05ade7dc8836304aa/sibyl_core-1.0.0.tar.gz"
    sha256 "ad8596cb55ead8ec70322157284660b9f0a5afee614168b84f36fa068b156ad4"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/07/f9/e17a055beaf2a171d4990d373f72dc08f86ab0c102dc20fdb19fabda5a8c/sibyld-1.0.0.tar.gz"
    sha256 "f48bb88e7355c1f4e122c56b1aceb59290d4a0445e3260a8a890ca6290279fe9"
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
