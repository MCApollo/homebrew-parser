name :
	 Singular
homepage :
	 https://www.singular.uni-kl.de/
url :
	 https://www.mathematik.uni-kl.de/ftp/pub/Math/Singular/SOURCES/4-1-1/singular-4.1.1.tar.gz
description :
	 Computer algebra system for polynomial computations
build_deps :
link_deps :
	 gmp
	 mpfr
	 ntl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "CXXFLAGS=-std=c++11"
	 system "make", "install"
