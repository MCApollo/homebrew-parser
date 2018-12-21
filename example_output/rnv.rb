name :
	 Rnv
homepage :
	 https://sourceforge.net/projects/rnv/
url :
	 https://downloads.sourceforge.net/project/rnv/Sources/1.7.11/rnv-1.7.11.tar.bz2
description :
	 Implementation of Relax NG Compact Syntax validator
build_deps :
link_deps :
	 expat
conflicts :
	 arx-libertatis
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
