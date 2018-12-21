name :
	 Stone
homepage :
	 http://www.gcd.org/sengoku/stone/
url :
	 http://www.gcd.org/sengoku/stone/stone-2.3e.tar.gz
description :
	 TCP/IP packet repeater in the application layer
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "macosx"
	 bin.install "stone"
