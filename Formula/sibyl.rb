# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/86/b5/8d5cfd4bd8b8566e273fe326be43bb1242b43faa92dc8495ea46a66a2156/sibyl_dev-1.0.0rc5.tar.gz"
  sha256 "db5b32a583564b2bd60c30772fe883d84f0919e57b3c42ee68c830e58ffe8865"
  license "Apache-2.0"
  version "1.0.0-rc.5"

  PYTHON_PACKAGE_VERSION = "1.0.0rc5"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/4b/19/78ca9c46e77fe286839c0b4f79ce634674c3273283ba3a9bb18460b29f9e/sibyl_core-1.0.0rc5.tar.gz"
    sha256 "811f999307bf7fc8464cc6bb6bd97ae29c81794402b914f724fe2da7061a7a08"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/c7/2d/290864ea835b4bdfd7cf3eb6f64aa4fd9c4f1c36d746f5fa70d7d3d40d60/sibyld-1.0.0rc5.tar.gz"
    sha256 "ae41062f8178d1ff3a3e22f7978614a30078ebd03870af90628cfd56e2194edc"
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
