name :
	 Libwpd
homepage :
	 https://libwpd.sourceforge.io/
url :
	 https://dev-www.libreoffice.org/src/libwpd-0.10.2.tar.xz
description :
	 General purpose library for reading WordPerfect files
build_deps :
	 pkg-config
link_deps :
	 glib
	 libgsf
	 librevenge
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
