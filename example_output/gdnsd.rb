name :
	 Gdnsd
homepage :
	 https://gdnsd.org/
url :
	 https://github.com/gdnsd/gdnsd/releases/download/v2.4.0/gdnsd-2.4.0.tar.xz
description :
	 Authoritative-only DNS server
build_deps :
link_deps :
	 libev
	 libunwind-headers
	 ragel
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-rundir=#{var}/run",
	 "--localstatedir=#{var}",
	 "--sysconfdir=#{etc}",
	 "--without-urcu"
	 system "make", "install"
