# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/12/04/8ae5c9cba74f80b9ed4726d94bdbf5d1330b184a971d2ac97068022af554/sibyl_dev-1.0.2.tar.gz"
  sha256 "a7b02da858dc0a7a5c1dce847f93a400cf03e9fdeae4df4276ab198ae9f2190d"
  license "Apache-2.0"
  version "1.0.2"

  PYTHON_PACKAGE_VERSION = "1.0.2"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/52/22/e49907d73758aa97ec869b1ec7acf5727dcbf628d51088cb2cd28f7348e2/sibyl_core-1.0.2.tar.gz"
    sha256 "90c8c4244bb3b32754f843590d49cb9dcf5833bb038be8098ee7a038c0008962"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/72/a4/fee9122d8302d1f5a041f92aa7c360d9c038dbaacfc76f519449d1dd9722/sibyld-1.0.2.tar.gz"
    sha256 "322cb5457749b5fc2bd53c17992ac506b4f7c708ba07b6055f849cf53e48986b"
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
