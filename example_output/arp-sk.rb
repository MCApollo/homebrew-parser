name :
	 ArpSk
homepage :
	 https://web.archive.org/web/20180223202629/sid.rstack.org/arp-sk/
url :
	 https://web.archive.org/web/20180223202629/sid.rstack.org/arp-sk/files/arp-sk-0.0.16.tgz
description :
	 ARP traffic generation tool
build_deps :
link_deps :
	 libnet
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-libnet=#{Formula["libnet"].opt_prefix}"
	 system "make", "install"
