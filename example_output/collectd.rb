name :
	 Collectd
homepage :
	 https://collectd.org/
url :
	 https://collectd.org/files/collectd-5.8.1.tar.bz2
description :
	 Statistics collection and monitoring daemon
build_deps :
	 pkg-config
link_deps :
	 libgcrypt
	 libtool
	 net-snmp
	 riemann-client
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --localstatedir=#{var}
	 --disable-java
	 --enable-write_riemann
	 ]
	 system "./build.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
