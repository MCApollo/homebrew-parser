name :
	 Rmtrash
homepage :
	 http://www.nightproductions.net/cli.htm
url :
	 http://www.nightproductions.net/downloads/rmtrash_source.tar.gz
description :
	 Move files to macOS's Trash
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "-o root -g wheel", ""
	 inreplace "Makefile", "${DESTDIR}/man", "${DESTDIR}/share/man"
	 bin.mkpath
	 man1.mkpath
	 system "make", "CC=#{ENV.cc}", "LDFLAGS=-framework Foundation -prebind"
	 system "make", "install", "DESTDIR=#{prefix}"
