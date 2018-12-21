name :
	 Sntop
homepage :
	 https://sntop.sourceforge.io/
url :
	 https://pkg.freebsd.org/ports-distfiles/sntop-1.4.3.tar.gz
description :
	 Curses-based utility that polls hosts to determine connectivity
build_deps :
link_deps :
	 fping
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--sysconfdir=#{etc}"
	 etc.mkpath
	 bin.mkpath
	 man1.mkpath
	 system "make", "install"
