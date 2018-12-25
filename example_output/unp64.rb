name :
	 Unp64
homepage :
	 http://iancoog.altervista.org/
url :
	 http://iancoog.altervista.org/C/unp64_235_src.tar.bz2
description :
	 Generic C64 prg unpacker,
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "src"
	 system "make", "unp64"
	 bin.install "Release/unp64"
