name :
	 FbiServefiles
homepage :
	 https://github.com/Steveice10/FBI
url :
	 https://github.com/Steveice10/FBI/archive/2.5.3.tar.gz
description :
	 Serve local files to Nintendo 3DS via FBI remote installer
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 venv.pip_install_and_link buildpath/"servefiles"
