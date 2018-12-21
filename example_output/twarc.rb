name :
	 Twarc
homepage :
	 https://github.com/DocNow/twarc
url :
	 https://files.pythonhosted.org/packages/e1/f2/2d79badd5fab00826d5fb2a66b0d1923933ef937338edbdbdd01ae3f5181/twarc-1.6.1.tar.gz
description :
	 Command-line tool and Python library for archiving Twitter JSON
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
	 system libexec/"bin/pip", "uninstall", "-y", "twarc"
	 venv.pip_install_and_link buildpath
