name :
	 Stubby
homepage :
	 https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Daemon+-+Stubby
url :
	 https://github.com/getdnsapi/stubby/archive/v0.2.3.tar.gz
description :
	 DNS privacy enabled stub resolver service based on getdns
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 getdns
	 libyaml
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make", "install"
