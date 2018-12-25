name :
	 Pdnsd
homepage :
	 http://members.home.nl/p.a.rombouts/pdnsd/
url :
	 http://members.home.nl/p.a.rombouts/pdnsd/releases/pdnsd-1.2.9a-par.tar.gz
description :
	 Proxy DNS server with permanent caching
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--sysconfdir=#{etc}",
	 "--mandir=#{man}",
	 "--with-cachedir=#{var}/cache/pdnsd"
	 system "make", "install"
