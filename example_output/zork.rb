name :
	 Zork
homepage :
	 https://github.com/devshane/zork
url :
	 https://github.com/devshane/zork/archive/v1.0.2.tar.gz
description :
	 The Dungeon modified from FORTRAN to C
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
	 system "make", "DATADIR=#{share}", "BINDIR=#{bin}"
	 system "make", "install", "DATADIR=#{share}", "BINDIR=#{bin}", "MANDIR=#{man}"
