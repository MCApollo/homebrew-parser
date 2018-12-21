name :
	 TwoLame
homepage :
	 https://sourceforge.net/projects/twolame/
url :
	 https://downloads.sourceforge.net/twolame/twolame-0.3.13.tar.gz
description :
	 Optimized MPEG Audio Layer 2 (MP2) encoder
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
