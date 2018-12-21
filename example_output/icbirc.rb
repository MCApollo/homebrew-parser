name :
	 Icbirc
homepage :
	 https://www.benzedrine.ch/icbirc.html
url :
	 https://www.benzedrine.ch/icbirc-2.1.tar.gz
description :
	 Proxy IRC client and ICB server
build_deps :
	 bsdmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "bsdmake"
	 bin.install "icbirc"
	 man8.install "icbirc.8"
