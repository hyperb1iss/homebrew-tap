# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/cb/fd/e7c6e6cbe58a4839ffae0c1506244b0b2541373c175f21208f8d583af7f2/sibyl_dev-1.1.5.tar.gz"
  sha256 "fd9d60a9ae8c57bd2e2c32769b6feb896c74bc05fb4686de651f90fc766fd0b5"
  license "Apache-2.0"
  version "1.1.5"

  PYTHON_PACKAGE_VERSION = "1.1.5"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/31/6d/dc4314feee26bf62f46b20f6e01a17392d81129ad7c56de157a62072376d/sibyl_core-1.1.5.tar.gz"
    sha256 "129a6732eb220f5d5e75a2445c94351eabd54bb012b7c0cd150861fd25ac6aef"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/16/c8/dcf1a07d2989facec6cfbdd06c63ac7d2582061f544642acbae9f6e480cd/sibyld-1.1.5.tar.gz"
    sha256 "5c386c2b1155375a8c81fe2468185f2a672e8dc3f5f88b8c343ca29fa39d76af"
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
