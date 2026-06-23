# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/6f/8b/e4a833fc9aa0175927bb643e0f337e080ebea26e46140579510e26b7058d/sibyl_dev-1.0.0rc6.tar.gz"
  sha256 "945ea5b0a484eb123fe849fb129f708d3b02b906061403256abe56c577f3e41e"
  license "Apache-2.0"
  version "1.0.0-rc.6"

  PYTHON_PACKAGE_VERSION = "1.0.0rc6"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/36/2b/2965ad6abb4760d3bdd42b236a6ea008610db4f841924bed9f3aff26a6fe/sibyl_core-1.0.0rc6.tar.gz"
    sha256 "bccf3bae0a0f199c5d79dc706377d742f07fda9b1798415b1adb2d6c382e2637"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/c9/bb/e04992d6f84de34493f9822851a918c50fcabed5a067e05893842f3a8919/sibyld-1.0.0rc6.tar.gz"
    sha256 "ff20f26b8ba2956e689e65b66403b9afbc3d41a47d091c94e3203750d655f221"
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
