name :
	 ArpScan
homepage :
	 https://github.com/royhills/arp-scan
url :
	 https://github.com/royhills/arp-scan/archive/1.9.5.tar.gz
description :
	 ARP scanning and fingerprinting tool
build_deps :
	 autoconf
	 automake
link_deps :
	 libpcap
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
