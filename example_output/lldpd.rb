name :
	 Lldpd
homepage :
	 https://vincentbernat.github.io/lldpd/
url :
	 https://media.luffy.cx/files/lldpd/lldpd-1.0.1.tar.gz
description :
	 Implementation of IEEE 802.1ab (LLDP)
build_deps :
	 pkg-config
link_deps :
	 libevent
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 readline = Formula["readline"]
	 args = %W[
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 --localstatedir=#{var}
	 --with-launchddaemonsdir=no
	 --with-privsep-chroot=/var/empty
	 --with-privsep-group=nogroup
	 --with-privsep-user=nobody
	 --with-readline
	 --with-xml
	 --without-snmp
	 CPPFLAGS=-I#{readline.include}\ -DRONLY=1
	 LDFLAGS=-L#{readline.lib}
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 (var/"run").mkpath
