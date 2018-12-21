name :
	 Libcoap
homepage :
	 https://github.com/obgm/libcoap
url :
	 https://github.com/obgm/libcoap/archive/v4.1.2.tar.gz
description :
	 Lightweight application-protocol for resource-constrained devices
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-examples"
	 system "make"
	 system "make", "install"
