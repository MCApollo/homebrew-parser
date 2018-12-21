name :
	 Mpir
homepage :
	 http://mpir.org/
url :
	 http://mpir.org/mpir-3.0.0.tar.bz2
description :
	 Multiple Precision Integers and Rationals (fork of GMP)
build_deps :
	 yasm
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[--disable-silent-rules --prefix=#{prefix} --enable-cxx]
	 args << "--build=core2-apple-darwin#{`uname -r`.to_i}" if build.bottle?
	 system "./configure", *args
	 system "make", "install"
