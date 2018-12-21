name :
	 Wakeonlan
homepage :
	 https://github.com/jpoliv/wakeonlan
url :
	 https://github.com/jpoliv/wakeonlan/archive/wakeonlan-0.41.tar.gz
description :
	 Sends magic packets to wake up network-devices
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "perl", "Makefile.PL"
	 system "make"
	 bin.install "blib/script/wakeonlan"
	 man1.install "blib/man1/wakeonlan.1"
