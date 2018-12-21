name :
	 Liblzf
homepage :
	 http://oldhome.schmorp.de/marc/liblzf.html
url :
	 http://dist.schmorp.de/liblzf/liblzf-3.6.tar.gz
description :
	 Very small, very fast data compression library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
