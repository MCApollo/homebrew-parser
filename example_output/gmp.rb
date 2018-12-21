name :
	 Gmp
homepage :
	 https://gmplib.org/
url :
	 https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz
description :
	 GNU multiple precision arithmetic library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[--prefix=#{prefix} --enable-cxx --with-pic]
	 args << "--build=core2-apple-darwin#{`uname -r`.to_i}" if build.bottle?
	 system "./configure", *args
	 system "make"
	 system "make", "check"
	 system "make", "install"
