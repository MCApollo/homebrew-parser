name :
	 Sipp
homepage :
	 https://sipp.sourceforge.io/
url :
	 https://github.com/SIPp/sipp/releases/download/v3.5.2/sipp-3.5.2.tar.gz
description :
	 Traffic generator for the SIP protocol
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--with-pcap"
	 system "make", "DESTDIR=#{prefix}"
	 bin.install "sipp"
