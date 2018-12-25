name :
	 Aria2
homepage :
	 https://aria2.github.io/
url :
	 https://github.com/aria2/aria2/releases/download/release-1.34.0/aria2-1.34.0.tar.xz
description :
	 Download with resuming and segmented downloading
build_deps :
	 pkg-config
link_deps :
	 libssh2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "src/bignum.h", "make_unique", "std::make_unique"
	 inreplace "configure", "-std=c++11", "-std=c++14"
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-appletls
	 --with-libssh2
	 --without-openssl
	 --without-gnutls
	 --without-libgmp
	 --without-libnettle
	 --without-libgcrypt
	 ]
	 system "./configure", *args
	 system "make", "install"
	 bash_completion.install "doc/bash_completion/aria2c"
