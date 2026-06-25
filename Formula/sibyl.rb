# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/86/ed/cb17682c7dd347cbbae2bce2df73349e782c9b9a5a366b8bdd3263c71e61/sibyl_dev-1.0.0rc8.tar.gz"
  sha256 "b9aaad3cfed16ed42b5c62aecc99a60c9344877845e0025bf519c859e9cd366d"
  license "Apache-2.0"
  version "1.0.0-rc.8"

  PYTHON_PACKAGE_VERSION = "1.0.0rc8"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/6d/36/397f8d051bd7cf147324b6f27ecc3f8878b19d3f0346707d0b9b7bdaeab0/sibyl_core-1.0.0rc8.tar.gz"
    sha256 "650198dfeb92878e2f4cdb39ff3495d23d186adb26f311eed0d239b9e6e73ad0"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/da/63/951872c981ab387c9154de995237ec8e207266a7886bac60268ef717ad8d/sibyld-1.0.0rc8.tar.gz"
    sha256 "39da93ded1a99f415a5dce9357ae5796242aad0ac66cd8ff42269a9ca0e1a14c"
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
