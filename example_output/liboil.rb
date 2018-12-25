name :
	 Liboil
homepage :
	 https://wiki.freedesktop.org/liboil/
url :
	 https://liboil.freedesktop.org/download/liboil-0.3.17.tar.gz
description :
	 C library of simple functions optimized for various CPUs
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-fheinous-gnu-extensions" if ENV.compiler == :clang
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
