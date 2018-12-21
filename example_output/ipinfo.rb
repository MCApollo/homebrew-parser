name :
	 Ipinfo
homepage :
	 http://kyberdigi.cz/projects/ipinfo/
url :
	 http://kyberdigi.cz/projects/ipinfo/files/ipinfo-1.2.tar.gz
description :
	 Tool for calculation of IP networks
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "BINDIR=#{bin}", "MANDIR=#{man1}", "install"
