name :
	 Todoman
homepage :
	 https://todoman.readthedocs.io/
url :
	 https://files.pythonhosted.org/packages/bb/49/25511ca1f2762eda6cd95ccf1bd62c9ca5009469445b9263064a5ffbff78/todoman-3.4.0.tar.gz
description :
	 Simple CalDAV-based todo manager
build_deps :
link_deps :
	 python
conflicts :
	 devtodo
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
