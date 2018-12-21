name :
	 Libtcod
homepage :
	 http://roguecentral.org/doryen/libtcod/
url :
	 https://bitbucket.org/libtcod/libtcod/get/1.8.2.tar.bz2
description :
	 API for roguelike developers
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 sdl2
conflicts :
	 libzip
patches :
EOF_patch :
install :
	 cd "build/autotools" do
	 system "autoreconf", "-fiv"
	 system "./configure"
	 system "make"
	 lib.install Dir[".libs/*{.a,.dylib}"]
