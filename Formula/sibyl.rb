# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/74/bb/54c3e2e9892fa5dc13a5dfbe1389d3482ba1ed16178977edcbc314cdce7a/sibyl_dev-1.1.3.tar.gz"
  sha256 "23eff8b8311b79fb4ab40d2d4168d7bd3663434a18d543fee34956bc55b485f8"
  license "Apache-2.0"
  version "1.1.3"

  PYTHON_PACKAGE_VERSION = "1.1.3"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/a5/f2/f2d84adee1fa90527d800a6b031802aeb2f2441a3efbabdeb0f3c48444a3/sibyl_core-1.1.3.tar.gz"
    sha256 "18fb0846dc7df86fe81e71aaaaef6c10a9f1f7e6f4265bdb718e0a05c888db10"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/be/23/5a4247b143040583230a35c3437b7ae85d520aef6a5a3e21f59564441531/sibyld-1.1.3.tar.gz"
    sha256 "8a5c44d1f13d59de3428efd2b911f39afd155c7023607e523e8681e47c57c524"
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
