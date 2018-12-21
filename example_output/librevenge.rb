name :
	 Librevenge
homepage :
	 https://sourceforge.net/p/libwpd/wiki/librevenge/
url :
	 https://dev-www.libreoffice.org/src/librevenge-0.0.4.tar.bz2
description :
	 Base library for writing document import filters
build_deps :
	 pkg-config
link_deps :
	 boost
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--without-docs",
	 "--disable-dependency-tracking",
	 "--enable-static=no",
	 "--disable-werror",
	 "--disable-tests",
	 "--prefix=#{prefix}"
	 system "make", "install"
