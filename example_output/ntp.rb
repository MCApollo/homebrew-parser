name :
	 Ntp
homepage :
	 https://www.eecis.udel.edu/~mills/ntp/html/
url :
	 https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p12.tar.gz
description :
	 The Network Time Protocol (NTP) Distribution
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
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --with-openssl-libdir=#{Formula["openssl"].lib}
	 --with-openssl-incdir=#{Formula["openssl"].include}
	 --with-net-snmp-config=no
	 ]
	 system "./configure", *args
	 system "make", "install", "LDADD_LIBNTP=-lresolv -undefined dynamic_lookup"
