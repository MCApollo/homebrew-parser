name :
	 Libplist
homepage :
	 https://www.libimobiledevice.org/
url :
	 https://www.libimobiledevice.org/downloads/libplist-2.0.0.tar.bz2
description :
	 Library for Apple Binary- and XML-Property Lists
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --without-cython
	 ]
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "install", "PYTHON_LDFLAGS=-undefined dynamic_lookup"
