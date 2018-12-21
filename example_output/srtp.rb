name :
	 Srtp
homepage :
	 https://github.com/cisco/libsrtp
url :
	 https://github.com/cisco/libsrtp/archive/v2.2.0.tar.gz
description :
	 Implementation of the Secure Real-time Transport Protocol
build_deps :
	 pkg-config
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 ]
	 args << "--enable-openssl" if build.with? "openssl"
	 system "./configure", *args
	 system "make", "test"
	 system "make", "shared_library"
	 system "make", "install"
	 libexec.install "test/rtpw"
