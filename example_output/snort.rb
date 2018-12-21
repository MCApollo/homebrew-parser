name :
	 Snort
homepage :
	 https://www.snort.org
url :
	 https://www.snort.org/downloads/snort/snort-2.9.11.1.tar.gz
description :
	 Flexible Network Intrusion Detection System
build_deps :
	 pkg-config
link_deps :
	 daq
	 libdnet
	 luajit
	 openssl
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 openssl = Formula["openssl"]
	 args = %W[
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}/snort
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --enable-active-response
	 --enable-flexresp3
	 --enable-gre
	 --enable-mpls
	 --enable-normalizer
	 --enable-react
	 --enable-reload
	 --enable-sourcefire
	 --enable-targetbased
	 --with-openssl-includes=#{openssl.opt_include}
	 --with-openssl-libraries=#{openssl.opt_lib}
	 ]
	 system "./configure", *args
	 system "make", "install"
	 rm Dir[buildpath/"etc/Makefile*"]
	 (etc/"snort").install Dir[buildpath/"etc/*"]
