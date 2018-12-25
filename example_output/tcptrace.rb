name :
	 Tcptrace
homepage :
	 http://www.tcptrace.org/
url :
	 https://www.mirrorservice.org/sites/distfiles.macports.org/tcptrace/tcptrace-6.6.7.tar.gz
description :
	 Analyze tcpdump output
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "tcptrace"
	 inreplace "Makefile", "-o bin -g bin", ""
	 system "make", "install", "BINDIR=#{bin}", "MANDIR=#{man}"
