name :
	 Yaf
homepage :
	 https://tools.netsa.cert.org/yaf/
url :
	 https://tools.netsa.cert.org/releases/yaf-2.10.0.tar.gz
description :
	 Yet another flowmeter: processes packet data from pcap(3)
build_deps :
	 pkg-config
link_deps :
	 glib
	 libfixbuf
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
