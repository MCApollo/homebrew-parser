name :
	 Libmspub
homepage :
	 https://wiki.documentfoundation.org/DLP/Libraries/libmspub
url :
	 https://dev-www.libreoffice.org/src/libmspub/libmspub-0.1.4.tar.xz
description :
	 Interpret and import Microsoft Publisher content
build_deps :
	 boost
	 libwpg
	 pkg-config
link_deps :
	 icu4c
	 librevenge
	 libwpd
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
