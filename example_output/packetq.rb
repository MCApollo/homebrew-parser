name :
	 Packetq
homepage :
	 https://www.dns-oarc.net/tools/packetq
url :
	 https://www.dns-oarc.net/files/packetq/packetq-1.4.1.tar.gz
description :
	 SQL-frontend to PCAP-files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
