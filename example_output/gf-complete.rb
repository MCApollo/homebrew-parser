name :
	 GfComplete
homepage :
	 http://jerasure.org/
url :
	 http://lab.jerasure.org/jerasure/gf-complete/repository/archive.tar.gz?ref=v2.0
description :
	 Comprehensive Library for Galois Field Arithmetic
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
