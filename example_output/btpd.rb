name :
	 Btpd
homepage :
	 https://github.com/btpd/btpd
url :
	 https://github.com/downloads/btpd/btpd/btpd-0.16.tar.gz
description :
	 BitTorrent Protocol Daemon
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
