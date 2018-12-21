name :
	 CurlOpenssl
homepage :
	 https://curl.haxx.se/
url :
	 https://curl.haxx.se/download/curl-7.63.0.tar.bz2
description :
	 Get a file from an HTTP, HTTPS or FTP server
build_deps :
	 pkg-config
link_deps :
	 brotli
	 nghttp2
	 openldap
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-mmacosx-version-min=10.7" if MacOS.version <= :lion
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --disable-ares
	 --with-ca-bundle=#{etc}/openssl/cert.pem
	 --with-ca-path=#{etc}/openssl/certs
	 --with-gssapi
	 --without-libidn2
	 --without-libmetalink
	 --without-librtmp
	 --without-libssh2
	 --with-ssl=#{Formula["openssl"].opt_prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"
	 libexec.install "lib/mk-ca-bundle.pl"
