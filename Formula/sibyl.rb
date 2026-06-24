# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/91/b9/984fce165707c56f429a2100f30e780c813c0d2105b661f8fe22870fe7c4/sibyl_dev-1.0.0rc7.tar.gz"
  sha256 "e307762acac27b8f47a0c53d495eb65a7b757f0c9affc6e2abdbdbb5fe7485e4"
  license "Apache-2.0"
  version "1.0.0-rc.7"

  PYTHON_PACKAGE_VERSION = "1.0.0rc7"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/02/d1/6acf344786da3535ed1f802d1b345d555b4983448f9e5de5d8c33f07e8ee/sibyl_core-1.0.0rc7.tar.gz"
    sha256 "8f74d91d991042627d815228229e10dae5563df13732a43c95f7aad683aa4da5"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/1e/9d/6f9b9e081a522ad1698e5aea0e2c1fd90e69317fa7dcb519fafef8c02ccc/sibyld-1.0.0rc7.tar.gz"
    sha256 "55fc59c1d238e1eeab25d2f3112f38bc971f10b2416c86f4ce2aa5b0b01e8260"
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
