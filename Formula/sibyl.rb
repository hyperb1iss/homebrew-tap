# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/8d/62/a56ad1a6a5ec9ccb5a6975c14732c605a5cb878613ea52a0432c53b5b4fc/sibyl_dev-1.4.3.tar.gz"
  sha256 "72069aba31ec9324af38a3bdb07bc96ec741aa4d0a4f3fdb17bf20c7ea80debe"
  license "Apache-2.0"
  version "1.4.3"

  PYTHON_PACKAGE_VERSION = "1.4.3"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/37/14/1f08fdf73250c5b69ee0106ae0c662d7cc0394390c04a3244eedddaeef97/sibyl_core-1.4.3.tar.gz"
    sha256 "6379360da2a10ba772b44cc8011bdcb54058baa59c6aa575d7869565928d2118"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/64/5f/6d93d696a6f7bf0d2ad95a7c1aed01be434be440dff54c8095219bfbac8b/sibyld-1.4.3.tar.gz"
    sha256 "b789d99edac6102f5927c5d0fdb55c321f48c8882b2a9f8c6e002b4cf987455d"
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
