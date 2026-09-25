# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/58/f5/9d916152fbce568d13acb5489f70825a0e824c1ded835125215ed1a9f204/sibyl_dev-1.4.1.tar.gz"
  sha256 "f562e90e7cf00653183e59737921e8a9c24a9354caad407e58bc0fc9638c7799"
  license "Apache-2.0"
  version "1.4.1"

  PYTHON_PACKAGE_VERSION = "1.4.1"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/fa/27/a6c8c2b7bb911101aeff2d427f8f40511e56041401dfdfc8272acfd3a437/sibyl_core-1.4.1.tar.gz"
    sha256 "45683a372933572692b121ca727d7328746de3f6c8c4a54566c78175b7c3c087"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/58/e9/50a70a4bc6d40f9057cae5c1d8a35931a4bc707d54b23dcda169521d5c02/sibyld-1.4.1.tar.gz"
    sha256 "04dbf05e86e478f152924b6337bfb07c3091467dd39e8d0efe1c19255ef71236"
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
