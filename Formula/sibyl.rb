# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/4d/b5/04f68cab20fa8f5fbcfe0fc9057e2b72db22103e32452683008027134465/sibyl_dev-1.1.1.tar.gz"
  sha256 "1d56a166d8bd179dccd7144d57aa3b0a36f9fa63367b3a87f80e7778b4e640aa"
  license "Apache-2.0"
  version "1.1.1"

  PYTHON_PACKAGE_VERSION = "1.1.1"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/b2/80/5ad37d642c7f55ef5852850f6c93d25c82059ece28a4302bed27591b2a56/sibyl_core-1.1.1.tar.gz"
    sha256 "4666b0491a749ea30309ea1f37d0869c1d6c85a010294868ae2e3cefe9656ff9"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/0e/34/ae09b97b335ca23ef79721549aff9c0e777687a3242249b55209d0c27f11/sibyld-1.1.1.tar.gz"
    sha256 "f63cf6ac1ddbbbd65a233d2d28984aa850eada750e5158b8c6aa986be4f683f4"
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
