name :
	 Libodfgen
homepage :
	 https://sourceforge.net/p/libwpd/wiki/libodfgen/
url :
	 https://dev-www.libreoffice.org/src/libodfgen-0.1.6.tar.bz2
description :
	 ODF export library for projects using librevenge
build_deps :
	 boost
	 libetonyek
	 libwpg
	 pkg-config
link_deps :
	 librevenge
	 libwpd
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--without-docs",
	 "--disable-dependency-tracking",
	 "--enable-static=no",
	 "--with-sharedptr=boost",
	 "--disable-werror",
	 "--prefix=#{prefix}"
	 system "make", "install"
