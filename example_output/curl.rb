name :
	 Curl
homepage :
	 https://curl.haxx.se/
url :
	 https://curl.haxx.se/download/curl-7.63.0.tar.bz2
description :
	 Get a file from an HTTP, HTTPS or FTP server
build_deps :
	 pkg-config
link_deps :
	 openssl
	 openssl
	 c-ares
	 libmetalink
	 libssh2
	 nghttp2
	 rtmpdump
conflicts :
patches :
EOF_patch :
install :
	 system "./buildconf" if build.head?
	 ENV.append_to_cflags "-mmacosx-version-min=10.7" if MacOS.version <= :lion
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 ]
	 if MacOS.version < :mountain_lion || build.with?("openssl") || build.with?("nghttp2")
	 ENV.prepend_path "PKG_CONFIG_PATH", "#{Formula["openssl"].opt_lib}/pkgconfig"
	 args << "--with-ssl=#{Formula["openssl"].opt_prefix}"
	 args << "--with-ca-bundle=#{etc}/openssl/cert.pem"
	 args << "--with-ca-path=#{etc}/openssl/certs"
	 else
	 args << "--with-darwinssl"
	 args << "--without-ca-bundle"
	 args << "--without-ca-path"
	 end
	 args << (build.with?("libssh2") ? "--with-libssh2" : "--without-libssh2")
	 args << (build.with?("libmetalink") ? "--with-libmetalink" : "--without-libmetalink")
	 args << (build.with?("gssapi") ? "--with-gssapi" : "--without-gssapi")
	 args << (build.with?("rtmpdump") ? "--with-librtmp" : "--without-librtmp")
	 if build.with? "c-ares"
	 args << "--enable-ares=#{Formula["c-ares"].opt_prefix}"
	 else
	 args << "--disable-ares"
	 end
	 system "./configure", *args
	 system "make", "install"
	 system "make", "install", "-C", "scripts"
	 libexec.install "lib/mk-ca-bundle.pl"
