name :
	 Scale2x
homepage :
	 https://www.scale2x.it/
url :
	 https://github.com/amadvance/scale2x/releases/download/v4.0/scale2x-4.0.tar.gz
description :
	 Real-time graphics effect
build_deps :
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "CPPFLAGS=-I/usr/include/malloc/"
	 system "make", "install"
