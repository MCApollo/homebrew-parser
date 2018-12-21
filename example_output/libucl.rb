name :
	 Libucl
homepage :
	 https://github.com/vstakhov/libucl
url :
	 https://github.com/vstakhov/libucl/archive/0.8.1.tar.gz
description :
	 Universal configuration library parser
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --enable-utils
	 --prefix=#{prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"
