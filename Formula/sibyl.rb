# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/80/e3/1fbd0c6ae799c5739dfe274a857d141881a9e1c4776d9298ead5abee4355/sibyl_dev-1.4.7.tar.gz"
  sha256 "4f8787fb3f1f0111c10e0c16cadc69ccfa930f136c1b079b549f54562ac23136"
  license "Apache-2.0"
  version "1.4.7"

  PYTHON_PACKAGE_VERSION = "1.4.7"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/c1/ba/193d688706fbe040ec8cee9edb992bf6c33b1e6082ec9b7d90d235b20dc2/sibyl_core-1.4.7.tar.gz"
    sha256 "ad6185116c3fdd3ec012d65c08f97f592d473cc3a05c673af78c4a22ebe17da5"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/6f/68/964e9268727717e906c5013b08f914af7c63ca8b4a559e882d580c97d58b/sibyld-1.4.7.tar.gz"
    sha256 "f4f709a32ade6cc9b4edb3bdd810d5562d5d95052958576470e0028346a4891a"
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
