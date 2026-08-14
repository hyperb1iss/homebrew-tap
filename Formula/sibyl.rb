# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/51/9b/c0c4ffc7b54689ac6936ac185c481e48809bc3a19c48138b471aa3d548f9/sibyl_dev-1.2.2.tar.gz"
  sha256 "40d5329fedbc6382c0ff25159f2b2dab2d873ee4b07d7f2a9ade4e1bd2dfa692"
  license "Apache-2.0"
  version "1.2.2"

  PYTHON_PACKAGE_VERSION = "1.2.2"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/a4/47/91d862117e990800a198538772b379a2fa1722a74dd51198384c1336cea7/sibyl_core-1.2.2.tar.gz"
    sha256 "d3558b4ca397da2f7995b9de88e7b04300af3a12d868386f86a5a6747ee0fd09"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/70/07/076e2752e4649aaf969f741db5db8b7d2be1b026f3dd8dd1fd33281ee060/sibyld-1.2.2.tar.gz"
    sha256 "81233483823a20ef20a3069918365eda7f844d7ba00282881237a4e6b94fb8d4"
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
