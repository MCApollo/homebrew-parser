name :
	 Nettle
homepage :
	 https://www.lysator.liu.se/~nisse/nettle/
url :
	 https://ftp.gnu.org/gnu/nettle/nettle-3.4.1.tar.gz
description :
	 Low-level cryptographic library
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
	 inreplace "testsuite/dlopen-test.c", "libnettle.so", "libnettle.dylib"
	 if DevelopmentTools.clang_build_version >= 1000
	 inreplace "testsuite/symbols-test", "get_pc_thunk",
	 "get_pc_thunk|(_*chkstk_darwin)"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-shared"
	 system "make"
	 system "make", "install"
	 system "make", "check"
