# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/80/bc/5ae530d6da65da6aacffef321716c1c33125bf81d11f33e2654f85e54549/sibyl_dev-1.3.0.tar.gz"
  sha256 "2bc1e6feff477215d47ac55561b2199421a7719339687bc557ff5262e8dbf2a5"
  license "Apache-2.0"
  version "1.3.0"

  PYTHON_PACKAGE_VERSION = "1.3.0"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/2d/4a/e4a80c8303ed17573d724eaf4fa51b4b080197d85e9a185babd80750ce35/sibyl_core-1.3.0.tar.gz"
    sha256 "a9c3df4aafa85ce6a34eab2fab6365a2045581d44adbf070128199cbb0ad148e"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/a4/ed/3da71cad94ba4624d00c9f39375a20e1589933924be6e80f365ff409cf19/sibyld-1.3.0.tar.gz"
    sha256 "9c402c5405a703e477199114a0422af8cb6027846c1f3b1614d0d939142e724d"
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
