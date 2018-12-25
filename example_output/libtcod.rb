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
optional_deps :
conflicts :
	 libzip
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "build/autotools" do
	 system "autoreconf", "-fiv"
	 system "./configure"
	 system "make"
	 lib.install Dir[".libs/*{.a,.dylib}"]
	 end
	 include.install Dir["include/*"]
	 libexec.install "data"
