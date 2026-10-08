# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/96/96/2c8462ba1f986559b5cd2cc55c0a845ac261f8435fbde6473556224328e9/sibyl_dev-1.4.6.tar.gz"
  sha256 "cb228105974934c001d31e1964119d6168668e5aebad6fd7679445f694ff0250"
  license "Apache-2.0"
  version "1.4.6"

  PYTHON_PACKAGE_VERSION = "1.4.6"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/78/93/e4d07a5aa60e28043e265244f0cbb956f29cc81ef741d790d46c3cf4bc77/sibyl_core-1.4.6.tar.gz"
    sha256 "dffe7bdae405c14a5148a4e789a071a0555d802b0486565030acd4d5448997f7"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/dd/9b/5999479cb86fddf703bfa1f7b1dfa49c5bbe8240c7fa0866fe44e86b498e/sibyld-1.4.6.tar.gz"
    sha256 "7f583faa4017c0c8f0e8e1df98052f78aaec38e5ec767116a98a376e465d180a"
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
