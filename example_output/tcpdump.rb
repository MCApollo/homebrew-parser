name :
	 Tcpdump
homepage :
	 https://www.tcpdump.org/
url :
	 https://www.tcpdump.org/release/tcpdump-4.9.2.tar.gz
description :
	 Command-line packet analyzer
build_deps :
link_deps :
	 openssl
	 libpcap
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-ipv6",
	 "--disable-smb",
	 "--disable-universal"
	 system "make", "install"
