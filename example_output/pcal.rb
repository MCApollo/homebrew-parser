name :
	 Pcal
homepage :
	 https://pcal.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/pcal/pcal/pcal-4.11.0/pcal-4.11.0.tgz
description :
	 Generate Postscript calendars without X
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
	 system "make", "install", "BINDIR=#{bin}", "MANDIR=#{man1}",
	 "CATDIR=#{man}/cat1"
