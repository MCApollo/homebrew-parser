name :
	 Libssh2
homepage :
	 https://libssh2.org/
url :
	 https://libssh2.org/download/libssh2-1.8.0.tar.gz
description :
	 C library implementing the SSH2 protocol
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --disable-examples-build
	 --with-openssl
	 --with-libz
	 --with-libssl-prefix=#{Formula["openssl"].opt_prefix}
	 ]
	 system "./buildconf" if build.head?
	 system "./configure", *args
	 system "make", "install"
