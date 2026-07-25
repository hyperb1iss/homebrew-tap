# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/2c/89/8593b76b3552983a0db66e4bb1134c93c3a559e964bd569f95a8fa14434f/sibyl_dev-1.1.4.tar.gz"
  sha256 "636a729c259881163a778ced975dcfdd172ce8052b095cff8b6a108d6cf72e9d"
  license "Apache-2.0"
  version "1.1.4"

  PYTHON_PACKAGE_VERSION = "1.1.4"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/cb/5f/83a0bf3ee6eab10f929f268c5aa659929ef4a768b3fe9646bc87b3a31277/sibyl_core-1.1.4.tar.gz"
    sha256 "a51dbfc02f149d79dd5ff57955175ec940a3847ebf5ba4b08131bbc74e2a9452"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/dc/07/ef9d4285a5193d54bdb208e42f85b867f9ff4fe5c3efb6a0c6706203de11/sibyld-1.1.4.tar.gz"
    sha256 "614dbc476b61a7896cbd70f74a91d1a2ee74e8e018fa692b39e8734f594800ff"
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
