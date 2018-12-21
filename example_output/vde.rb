name :
	 Vde
homepage :
	 https://vde.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/vde/vde2/2.3.2/vde2-2.3.2.tar.gz
description :
	 Ethernet compliant virtual network
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 ENV.deparallelize
	 system "make", "install"
