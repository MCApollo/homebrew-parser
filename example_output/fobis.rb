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
optional_deps :
conflicts :
resource :
	 ['pygooglechart', 'graphviz']
	 ['https://files.pythonhosted.org/packages/95/88/54f91552de1e1b0085c02b96671acfba6e351915de3a12a398533fc82e20/pygooglechart-0.4.0.tar.gz', 'https://files.pythonhosted.org/packages/fa/d1/63b62dee9e55368f60b5ea445e6afb361bb47e692fc27553f3672e16efb8/graphviz-0.8.2.zip']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install "pygooglechart"
	 venv.pip_install "graphviz"
	 venv.pip_install_and_link buildpath
