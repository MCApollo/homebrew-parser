name :
	 Doublecpp
homepage :
	 https://doublecpp.sourceforge.io/
url :
	 https://downloads.sourceforge.net/doublecpp/doublecpp-0.6.3.tar.gz
description :
	 Double dispatch in C++
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
