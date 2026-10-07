# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/29/29/5a2e81fb37b05da5457cb5ead22ff9cb74bcf4ce3cf55687e3258839ed40/sibyl_dev-1.4.5.tar.gz"
  sha256 "4706e90eb005d024853e0e050c8bf83b359d532bea95dd10a0ef2a720c19e3b9"
  license "Apache-2.0"
  version "1.4.5"

  PYTHON_PACKAGE_VERSION = "1.4.5"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/17/e3/1f45602b1e7b61d0cfbe0544604079b9cfd223550299af07bdd469842e59/sibyl_core-1.4.5.tar.gz"
    sha256 "226693addad913922a95eb689b3d53257ed593b66cbfe8ef88b711b81db52ac6"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/22/2b/6bae6c95b1fc5d42d9c3b31be1909ba91c95d1f57257b0d8774cf5890977/sibyld-1.4.5.tar.gz"
    sha256 "f54b8879f8a159761743fa4bec3ffe528f39d793d03708ca1f9fa2b3f2ec1269"
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
