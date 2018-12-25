name :
	 Libevent
homepage :
	 https://libevent.org/
url :
	 https://github.com/libevent/libevent/archive/release-2.1.8-stable.tar.gz
description :
	 Asynchronous event library
build_deps :
	 autoconf
	 automake
	 doxygen
	 libtool
	 pkg-config
link_deps :
	 openssl
optional_deps :
conflicts :
	 pincaster
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Doxyfile", /GENERATE_MAN\s*=\s*NO/, "GENERATE_MAN = YES"
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-debug-mode",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 system "make", "doxygen"
	 man3.install Dir["doxygen/man/man3/*.3"]
