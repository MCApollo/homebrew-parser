name :
	 Autopep8
homepage :
	 https://github.com/hhatto/autopep8
url :
	 https://files.pythonhosted.org/packages/5b/ba/37d30e4263c51ee5a655118ac8c331e96a4e45fd4cea876a74b87af9ffc1/autopep8-1.4.3.tar.gz
description :
	 Automatically formats Python code to conform to the PEP 8 style guide
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
