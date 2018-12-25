name :
	 Wolfssl
homepage :
	 https://www.wolfssl.com/wolfSSL/Home.html
url :
	 https://github.com/wolfSSL/wolfssl.git
description :
	 Embedded SSL Library written in C
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
	 ENV.delete("SDKROOT")
	 args = %W[
	 --disable-silent-rules
	 --disable-dependency-tracking
	 --infodir=#{info}
	 --mandir=#{man}
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 --disable-bump
	 --disable-examples
	 --disable-fortress
	 --disable-md5
	 --disable-sniffer
	 --disable-webserver
	 --enable-aesccm
	 --enable-aesgcm
	 --enable-alpn
	 --enable-blake2
	 --enable-camellia
	 --enable-certgen
	 --enable-certreq
	 --enable-chacha
	 --enable-crl
	 --enable-crl-monitor
	 --enable-curve25519
	 --enable-dtls
	 --enable-dh
	 --enable-ecc
	 --enable-eccencrypt
	 --enable-ed25519
	 --enable-filesystem
	 --enable-hc128
	 --enable-hkdf
	 --enable-inline
	 --enable-ipv6
	 --enable-jni
	 --enable-keygen
	 --enable-ocsp
	 --enable-opensslextra
	 --enable-poly1305
	 --enable-psk
	 --enable-rabbit
	 --enable-ripemd
	 --enable-savesession
	 --enable-savecert
	 --enable-sessioncerts
	 --enable-sha512
	 --enable-sni
	 --enable-supportedcurves
	 --enable-tls13
	 --enable-sp
	 ]
	 if MacOS.prefer_64_bit?
	 args << "--enable-fastmath" << "--enable-fasthugemath"
	 else
	 args << "--disable-fastmath" << "--disable-fasthugemath"
	 end
	 args << "--enable-aesni" if Hardware::CPU.aes? && !build.bottle?
	 ENV.append_to_cflags "-mdynamic-no-pic" if MacOS.prefer_64_bit?
	 system "./autogen.sh"
	 system "./configure", *args
	 system "make"
	 system "make", "check"
	 system "make", "install"
