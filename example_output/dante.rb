name :
	 Dante
homepage :
	 https://www.inet.no/dante/
url :
	 https://www.inet.no/dante/files/dante-1.4.2.tar.gz
description :
	 SOCKS server and client, implementing RFC 1928 and related standards
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-silent-rules",
	 "--enable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}/dante"
	 system "make", "install"
