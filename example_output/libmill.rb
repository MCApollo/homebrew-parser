name :
	 Libmill
homepage :
	 http://libmill.org/
url :
	 http://libmill.org/libmill-1.18.tar.gz
description :
	 Go-style concurrency in C
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "all", "check", "install"
