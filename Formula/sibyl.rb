# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/94/fc/937cb7ff6d5544ba79da962c659d72dbdb116e803870a583b697fee70fdf/sibyl_dev-1.0.1.tar.gz"
  sha256 "f90c3786bbc34d0de0635863bbc0260a8c62b9b49ad3999675ac844e72fd5e4d"
  license "Apache-2.0"
  version "1.0.1"

  PYTHON_PACKAGE_VERSION = "1.0.1"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/33/2d/52d283ec12302209e26fd07c39becfb532561fb14b7d8aa7f7411489918f/sibyl_core-1.0.1.tar.gz"
    sha256 "8babea00e37c0bb09787b73ffd3b195993c6d89b00c77ed08c7ee2f565126535"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/31/27/847f16ff3bbfaeda1d74a394b3283f5f3cd1dd7bf8920210045e3ee829ae/sibyld-1.0.1.tar.gz"
    sha256 "6c503818c1a6530f2c7c77fc433f85903c80e00045dd09fb20c77d68b073efb5"
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
