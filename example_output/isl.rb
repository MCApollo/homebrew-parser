name :
	 Isl
homepage :
	 http://isl.gforge.inria.fr/
url :
	 http://isl.gforge.inria.fr/isl-0.20.tar.xz
description :
	 Integer Set Library for the polyhedral model
build_deps :
link_deps :
	 gmp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-gmp=system",
	 "--with-gmp-prefix=#{Formula["gmp"].opt_prefix}"
	 system "make", "check"
	 system "make", "install"
	 (share/"gdb/auto-load").install Dir["#{lib}/*-gdb.py"]
