# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/32/ae/e18e45f58e388837c7f0e110a6fe3f56fdd4187c3049fea9eca6fe694735/sibyl_dev-1.4.0.tar.gz"
  sha256 "2ca7e7890626f5c97c12ce2db525d4540f1a5f0688ba61b04b7cda774b291e4f"
  license "Apache-2.0"
  version "1.4.0"

  PYTHON_PACKAGE_VERSION = "1.4.0"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/54/b2/6d981d2973b825615f479860004ae5616a13a5ed32bb6c74cbce087bd6d4/sibyl_core-1.4.0.tar.gz"
    sha256 "85c37d34258ab0e05d93fd6429143b6d7fae9c962e00ef75676a045e773c07c9"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/03/a7/6b33628454a6c0f4423b8bfd0dd486806619aac7d86bec5d1e199fc7158a/sibyld-1.4.0.tar.gz"
    sha256 "e31f2c6c030035869035b38025d2637fc5ae64b9b2c719eefdba250ab6f71657"
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
