name :
	 Softhsm
homepage :
	 https://www.opendnssec.org/softhsm/
url :
	 https://dist.opendnssec.org/source/softhsm-2.5.0.tar.gz
description :
	 Cryptographic store accessible through a PKCS#11 interface
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}/softhsm",
	 "--localstatedir=#{var}",
	 "--with-crypto-backend=openssl",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
	 (var/"lib/softhsm/tokens").mkpath
