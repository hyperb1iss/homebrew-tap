# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/af/3d/2ea81c1f83d00d477a78fcb1e9b23615371f9b4d0bc3a723d8a2d759452f/sibyl_dev-1.4.2.tar.gz"
  sha256 "d4b5f4f9ef09d400f747ee930a13b34562a7f05713087e7fd7ac5342de24a141"
  license "Apache-2.0"
  version "1.4.2"

  PYTHON_PACKAGE_VERSION = "1.4.2"

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/6d/8e/55fe79e3cd785d1b8223e475d7f69bb6d4444e3086df7a641e9e4c3043ee/sibyl_core-1.4.2.tar.gz"
    sha256 "327b52f4e0a949ecf0d66d21c80599463a18c54b2627eade86fed7aa8efaa6f8"
  end

  resource "sibyld" do
    url "https://files.pythonhosted.org/packages/0c/55/8e1ff23597216e3b2d5f3676aa92a63be2000916fcff46dd9a4d67861508/sibyld-1.4.2.tar.gz"
    sha256 "11855dec202a23fc3a2ce47948c75fc697a11664edf1ddf8b20cb33a2ab2154f"
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
