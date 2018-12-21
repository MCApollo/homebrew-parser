name :
	 Ginac
homepage :
	 https://www.ginac.de/
url :
	 https://www.ginac.de/ginac-1.7.4.tar.bz2
description :
	 Not a Computer algebra system
build_deps :
	 pkg-config
link_deps :
	 cln
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
