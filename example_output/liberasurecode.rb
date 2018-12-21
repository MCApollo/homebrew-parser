name :
	 Liberasurecode
homepage :
	 https://github.com/openstack/liberasurecode
url :
	 https://github.com/openstack/liberasurecode/archive/1.6.0.tar.gz
description :
	 Erasure Code API library written in C with pluggable backends
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 jerasure
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
