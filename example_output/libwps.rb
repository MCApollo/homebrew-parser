name :
	 Libwps
homepage :
	 https://libwps.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/libwps/libwps/libwps-0.4.10/libwps-0.4.10.tar.xz
description :
	 Library to import files in MS Works format
build_deps :
	 boost
	 pkg-config
link_deps :
	 librevenge
	 libwpd
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--without-docs"
	 system "make", "install"
