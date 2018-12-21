name :
	 Epic5
homepage :
	 http://www.epicsol.org/
url :
	 http://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION/epic5-2.0.1.tar.xz
description :
	 Enhanced, programmable IRC client
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-ipv6",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}"
	 system "make"
	 system "make", "test"
	 system "make", "install"
