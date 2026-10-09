# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/87/fd/be6252e596fda602e809716506cbb75621f27e709d44a633844df066f96d/sibyl_dev-1.4.8.tar.gz"
  sha256 "4affb5e9183164760ed91e7709d07746f5e73a2d140b2830425f5c016832a623"
  license "Apache-2.0"
  version "1.4.8"

  PYTHON_PACKAGE_VERSION = "1.4.8"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/1e/93/5cff6bdc9d74a4a04f532713778e58230ffb6a5d06e8aff267e690a8e1b1/sibyl_core-1.4.8.tar.gz"
    sha256 "8bb948ad025f703c708a21f2fec96d14cbf62cfb97d25a544f9fa0d40585a18c"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/34/e2/f40f39c7f786e7ca884a1b9ddb5ae10481764891aa7f3c31ce9982a61946/sibyld-1.4.8.tar.gz"
    sha256 "57c82f97a49e9a0a02766e217f01317709b1dac261caed6e59086749cc906f13"
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
