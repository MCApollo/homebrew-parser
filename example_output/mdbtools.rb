name :
	 Mdbtools
homepage :
	 https://github.com/brianb/mdbtools/
url :
	 https://github.com/brianb/mdbtools/archive/0.7.1.tar.gz
description :
	 Tools to facilitate the use of Microsoft Access databases
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 glib
	 readline
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 if MacOS.version == :snow_leopard
	 mkdir "build-aux"
	 touch "build-aux/config.rpath"
