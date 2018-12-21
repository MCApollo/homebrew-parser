name :
	 Libpng
homepage :
	 http://www.libpng.org/pub/png/libpng.html
url :
	 https://downloads.sourceforge.net/libpng/libpng-1.6.35.tar.xz
description :
	 Library for manipulating PNG images
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "test"
	 system "make", "install"
