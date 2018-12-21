name :
	 Rmcast
homepage :
	 http://www.land.ufrj.br/tools/rmcast/rmcast.html
url :
	 http://www.land.ufrj.br/tools/rmcast/download/rmcast-2.0.0.tar.gz
description :
	 IP Multicast library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
