name :
	 TwinePypi
homepage :
	 https://github.com/pypa/twine
url :
	 https://files.pythonhosted.org/packages/29/4d/801bbad5968e674c1ca047118025243a475f986a6f5b3ca36e5afece0f9f/twine-1.12.1.tar.gz
description :
	 Utilities for interacting with PyPI
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 pkgshare.install "tests/fixtures/twine-1.5.0-py2.py3-none-any.whl"
