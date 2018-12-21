name :
	 IkeScan
homepage :
	 https://github.com/royhills/ike-scan
url :
	 https://github.com/royhills/ike-scan/archive/1.9.4.tar.gz
description :
	 Discover and fingerprint IKE hosts
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
