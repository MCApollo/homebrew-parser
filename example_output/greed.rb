name :
	 Greed
homepage :
	 http://www.catb.org/~esr/greed/
url :
	 http://www.catb.org/~esr/greed/greed-4.2.tar.gz
description :
	 Game of consumption
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "/usr/share/man/man6", man6
	 bin.mkpath
	 man6.mkpath
	 (var/"greed").mkpath
	 system "make", "SFILE=#{var}/greed/greed.hs"
	 system "make", "install", "BIN=#{bin}"
