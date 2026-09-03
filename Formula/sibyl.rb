# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/54/94/589201e2417aad8a55530c21bfaeb32696aba2076ee57a77cb29e8a558a2/sibyl_dev-1.3.1.tar.gz"
  sha256 "41261970fb5f13895432ea755d65d872f5f68d171441455eee2d98e7c4d718cc"
  license "Apache-2.0"
  version "1.3.1"

  PYTHON_PACKAGE_VERSION = "1.3.1"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/cc/00/5d7d40e7700eeb4ea309a7c3ad1d3a658b9802de468a82f75dc40727f26d/sibyl_core-1.3.1.tar.gz"
    sha256 "207d4068f83b052366930251876f723c122b69e5f189798ab6f17bd016a44335"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/b1/37/7749540a5dc290f1ad3e967a3eefa547d65d99ef28afc7f069a24b46ddd6/sibyld-1.3.1.tar.gz"
    sha256 "37c7b1a899038bf8d93e8c4728dddb5d80dc3f4bc4385e1cd7972bba8c70e978"
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
