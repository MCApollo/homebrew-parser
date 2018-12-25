name :
	 Libwpg
homepage :
	 https://libwpg.sourceforge.io/
url :
	 https://dev-www.libreoffice.org/src/libwpg-0.3.2.tar.xz
description :
	 Library for reading and parsing Word Perfect Graphics format
build_deps :
	 pkg-config
link_deps :
	 librevenge
	 libwpd
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
