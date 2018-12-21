name :
	 Tor
homepage :
	 https://www.torproject.org/
url :
	 https://www.torproject.org/dist/tor-0.3.4.9.tar.gz
description :
	 Anonymizing overlay network for TCP
build_deps :
	 pkg-config
link_deps :
	 libevent
	 openssl
	 libscrypt
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 --localstatedir=#{var}
	 --with-openssl-dir=#{Formula["openssl"].opt_prefix}
	 ]
	 args << "--disable-libscrypt" if build.without? "libscrypt"
	 system "./configure", *args
	 system "make", "install"
