name :
	 Potrace
homepage :
	 https://potrace.sourceforge.io/
url :
	 https://potrace.sourceforge.io/download/1.15/potrace-1.15.tar.gz
description :
	 Convert bitmaps to vector graphics
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['head.pbm']
	 ['https://potrace.sourceforge.io/img/head.pbm']
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-libpotrace"
	 system "make", "install"
