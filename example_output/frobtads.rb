name :
	 Frobtads
homepage :
	 https://www.tads.org/frobtads.htm
url :
	 https://github.com/realnc/frobtads/releases/download/1.2.4/frobtads-1.2.4.tar.bz2
description :
	 TADS interpreter and compilers
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
