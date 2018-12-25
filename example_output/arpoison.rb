name :
	 Arpoison
homepage :
	 http://www.arpoison.net/
url :
	 http://www.arpoison.net/arpoison-0.7.tar.gz
description :
	 UNIX arp cache update utility
build_deps :
link_deps :
	 libnet
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "arpoison"
	 man8.install "arpoison.8"
