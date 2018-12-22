name :
	 Jemalloc
homepage :
	 http://jemalloc.net/
url :
	 https://github.com/jemalloc/jemalloc/releases/download/5.1.0/jemalloc-5.1.0.tar.bz2
description :
	 malloc implementation emphasizing fragmentation avoidance
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --with-jemalloc-prefix=
	 ]
	 if build.head?
	 args << "--with-xslroot=#{Formula["docbook-xsl"].opt_prefix}/docbook-xsl"
	 system "./autogen.sh", *args
	 system "make", "dist"
	 else
	 system "./configure", *args
	 end
	 system "make"
	 system "make", "check"
	 system "make", "install"
