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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "macosx"
	 bin.install "stone"
