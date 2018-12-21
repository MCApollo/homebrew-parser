name :
	 Ck
homepage :
	 http://concurrencykit.org/
url :
	 http://concurrencykit.org/releases/ck-0.6.0.tar.gz
description :
	 Concurrency primitives and non-blocking data structures library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
