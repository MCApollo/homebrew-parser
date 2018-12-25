name :
	 Ndpi
homepage :
	 https://www.ntop.org/products/deep-packet-inspection/ndpi/
url :
	 https://github.com/ntop/nDPI/archive/2.2.tar.gz
description :
	 Deep Packet Inspection (DPI) library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 json-c
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
