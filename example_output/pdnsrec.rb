name :
	 Pdnsrec
homepage :
	 https://www.powerdns.com/recursor.html
url :
	 https://downloads.powerdns.com/releases/pdns-recursor-4.1.4.tar.bz2
description :
	 Non-authoritative/recursing DNS server
build_deps :
	 pkg-config
link_deps :
	 boost
	 gcc
	 lua
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = %W[
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}/powerdns
	 --disable-silent-rules
	 --with-boost=#{Formula["boost"].opt_prefix}
	 --with-libcrypto=#{Formula["openssl"].opt_prefix}
	 --with-lua
	 --without-net-snmp
	 ]
	 system "./configure", *args
	 system "make", "install"
