name :
	 Enet
homepage :
	 http://enet.bespin.org
url :
	 http://enet.bespin.org/download/enet-1.3.13.tar.gz
description :
	 Provides a network communication layer on top of UDP
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
