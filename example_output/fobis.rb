name :
	 Fobis
homepage :
	 https://github.com/szaghi/FoBiS
url :
	 https://files.pythonhosted.org/packages/2f/7e/dd1bf258ea12f28b38f7416fec75792307bb624a939e255eec261e01fa89/FoBiS.py-2.9.3.tar.gz
description :
	 KISS build tool for automaticaly building modern Fortran projects
build_deps :
link_deps :
	 gcc
	 graphviz
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install "pygooglechart"
	 venv.pip_install "graphviz"
	 venv.pip_install_and_link buildpath
