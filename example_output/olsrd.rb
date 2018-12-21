name :
	 Olsrd
homepage :
	 http://www.olsr.org
url :
	 http://www.olsr.org/releases/0.9/olsrd-0.9.0.3.tar.bz2
description :
	 Implementation of the optimized link state routing protocol
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 lib.mkpath
	 args = %W[
	 DESTDIR=#{prefix}
	 USRDIR=#{prefix}
	 LIBDIR=#{lib}
	 ETCDIR=#{etc}
	 ]
	 system "make", "build_all", *args
	 system "make", "install_all", *args
