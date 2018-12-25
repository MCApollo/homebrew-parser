name :
	 Fragroute
homepage :
	 https://www.monkey.org/~dugsong/fragroute/
url :
	 https://www.monkey.org/~dugsong/fragroute/fragroute-1.2.tar.gz
description :
	 Intercepts, modifies and rewrites egress traffic for a specified host
build_deps :
link_deps :
	 libdnet
	 libevent
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/2f5cab626/fragroute/configure.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/2f5cab626/fragroute/fragroute.c.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/2f5cab626/fragroute/pcaputil.c.patch
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --sysconfdir=#{etc}
	 --with-libevent=#{Formula["libevent"].opt_prefix}
	 --with-libdnet=#{Formula["libdnet"].opt_prefix}
	 ]
	 args << "--with-libpcap=#{MacOS.sdk_path}/usr" unless MacOS::CLT.installed?
	 system "./configure", *args
	 system "make", "install"
