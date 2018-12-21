name :
	 Flake8
homepage :
	 http://flake8.pycqa.org/
url :
	 https://gitlab.com/pycqa/flake8/repository/archive.tar.gz?ref=3.6.0
description :
	 Lint your Python code for style and logical errors
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", name
	 venv.pip_install_and_link buildpath
