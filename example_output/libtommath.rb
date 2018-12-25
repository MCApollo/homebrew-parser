name :
	 Libtommath
homepage :
	 https://www.libtom.net/LibTomMath/
url :
	 https://github.com/libtom/libtommath/releases/download/v1.0.1/ltm-1.0.1.tar.xz
description :
	 C library for number theoretic multiple-precision integers
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["DESTDIR"] = prefix
	 system "make"
	 system "make", "test_standalone"
	 include.install Dir["tommath*.h"]
	 lib.install "libtommath.a"
	 pkgshare.install "test"
