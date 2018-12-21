name :
	 Libofx
homepage :
	 https://libofx.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/libofx/libofx/libofx-0.9.13.tar.gz
description :
	 Library to support OFX command responses
build_deps :
link_deps :
	 open-sp
conflicts :
patches :
EOF_patch :
install :
	 opensp = Formula["open-sp"]
	 system "./configure", "--disable-dependency-tracking",
	 "--with-opensp-includes=#{opensp.opt_include}/OpenSP",
	 "--with-opensp-libs=#{opensp.opt_lib}",
	 "--prefix=#{prefix}"
	 system "make", "install"
