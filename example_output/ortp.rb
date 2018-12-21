name :
	 Ortp
homepage :
	 https://www.linphone.org/technical-corner/ortp/overview
url :
	 https://nongnu.askapache.com/linphone/ortp/sources/ortp-0.27.0.tar.gz
description :
	 Real-time transport protocol (RTP, RFC3550) library
build_deps :
	 cmake
	 pkg-config
link_deps :
	 mbedtls
conflicts :
patches :
EOF_patch :
install :
	 resource("bctoolbox").stage do
	 args = std_cmake_args + %W[
	 -DCMAKE_INSTALL_PREFIX=#{libexec}
	 -DENABLE_TESTS_COMPONENT=OFF
	 ]
	 system "cmake", ".", *args
	 system "make", "install"
