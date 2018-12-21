name :
	 Srt
homepage :
	 https://www.srtalliance.org/
url :
	 https://github.com/Haivision/srt/archive/v1.3.1.tar.gz
description :
	 Secure Reliable Transport
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 openssl = Formula["openssl"]
	 system "cmake", ".", "-DWITH_OPENSSL_INCLUDEDIR=#{openssl.opt_include}",
	 "-DWITH_OPENSSL_LIBDIR=#{openssl.opt_lib}",
	 *std_cmake_args
	 system "make", "install"
