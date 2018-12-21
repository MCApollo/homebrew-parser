name :
	 Psutils
homepage :
	 http://knackered.org/angus/psutils/
url :
	 ftp://ftp.knackered.org/pub/psutils/psutils-p17.tar.gz
description :
	 Collection of PostScript document handling utilities
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 man1.mkpath
	 system "make", "-f", "Makefile.unix",
	 "PERL=/usr/bin/perl",
	 "BINDIR=#{bin}",
	 "INCLUDEDIR=#{pkgshare}",
	 "MANDIR=#{man1}",
	 "install"
