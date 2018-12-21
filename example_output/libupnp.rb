name :
	 Libupnp
homepage :
	 https://pupnp.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%201.6.25/libupnp-1.6.25.tar.bz2
description :
	 Portable UPnP development kit
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-ipv6
	 ]
	 system "./configure", *args
	 system "make", "install"
