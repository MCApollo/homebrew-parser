name :
	 R3
homepage :
	 https://github.com/c9s/r3
url :
	 https://github.com/c9s/r3/archive/1.3.4.tar.gz
description :
	 High-performance URL router library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 jemalloc
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-malloc=jemalloc"
	 system "make", "install"
