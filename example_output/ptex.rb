name :
	 Ptex
homepage :
	 http://ptex.us
url :
	 https://github.com/wdas/ptex/archive/v2.1.33.tar.gz
description :
	 Texture mapping system
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}"
	 system "make", "test"
	 system "make", "install"
