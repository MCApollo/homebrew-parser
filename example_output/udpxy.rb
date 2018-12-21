name :
	 Udpxy
homepage :
	 http://www.udpxy.com/
url :
	 http://www.udpxy.com/download/1_23/udpxy.1.0.23-12-prod.tar.gz
description :
	 UDP-to-HTTP multicast traffic relay daemon
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "DESTDIR=#{prefix}", "PREFIX=''"
