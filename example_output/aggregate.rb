name :
	 Aggregate
homepage :
	 https://web.archive.org/web/20160716192438/freecode.com/projects/aggregate/
url :
	 https://ftp.isc.org/isc/aggregate/aggregate-1.6.tar.gz
description :
	 Optimizes lists of prefixes to reduce list lengths
build_deps :
link_deps :
conflicts :
	 crush-tools
patches :
EOF_patch :
install :
	 bin.mkpath
	 man1.mkpath
	 inreplace "Makefile.in", "$(prefix)/man/man1", "$(prefix)/share/man/man1"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "CFLAGS=#{ENV.cflags}",
	 "LDFLAGS=#{ENV.ldflags}",
	 "install"
