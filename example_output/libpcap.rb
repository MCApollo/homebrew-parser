name :
	 Libpcap
homepage :
	 https://www.tcpdump.org/
url :
	 https://www.tcpdump.org/release/libpcap-1.9.0.tar.gz
description :
	 Portable library for network traffic capture
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-ipv6",
	 "--disable-universal"
	 system "make", "install"
