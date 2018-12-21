name :
	 Sdcc
homepage :
	 https://sdcc.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/sdcc/sdcc/3.8.0/sdcc-src-3.8.0.tar.bz2
description :
	 ANSI C compiler for Intel 8051, Maxim 80DS390, and Zilog Z80
build_deps :
link_deps :
	 boost
	 gputils
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "all"
	 system "make", "install"
	 rm Dir["#{bin}/*.el"]
