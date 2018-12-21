name :
	 Bzip2
homepage :
	 https://en.wikipedia.org/wiki/Bzip2
url :
	 https://ftp.osuosl.org/pub/clfs/conglomeration/bzip2/bzip2-1.0.6.tar.gz
description :
	 Freely available high-quality data compressor
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "$(PREFIX)/man", "$(PREFIX)/share/man"
	 system "make", "install", "PREFIX=#{prefix}"
