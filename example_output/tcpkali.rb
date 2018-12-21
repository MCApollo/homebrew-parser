name :
	 Tcpkali
homepage :
	 https://github.com/machinezone/tcpkali
url :
	 https://github.com/machinezone/tcpkali/releases/download/v1.1.1/tcpkali-1.1.1.tar.gz
description :
	 High performance TCP and WebSocket load generator and sink
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
