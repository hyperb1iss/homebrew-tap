# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/e4/22/65bcbb69dd39a75508692ee240c6bea4447e9d939d94dc9a8f7bed77c18c/sibyl_dev-1.1.2.tar.gz"
  sha256 "51b07a3873dbb317440e3fe2ff609381df29337acd0ad562ddb17de8b2bd412b"
  license "Apache-2.0"
  version "1.1.2"

  PYTHON_PACKAGE_VERSION = "1.1.2"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/36/2d/169be66ebaaa14271def864d7c7f26eedb984f40e9610bbcfd1ff4ef338b/sibyl_core-1.1.2.tar.gz"
    sha256 "19c94cf30960a6716cd11da9f562c049c6ab4c90ae7e941aceadff427a996d77"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/d5/30/a56fefde63c6016397e29c046ea94088d999528dcec3e63bc17b88b4db6b/sibyld-1.1.2.tar.gz"
    sha256 "ca7ee1873dd3e91b7cf683e5791be7e4f6b06a059442cfd712b12d087a52e008"
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
