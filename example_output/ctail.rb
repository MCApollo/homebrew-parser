name :
	 Ctail
homepage :
	 https://github.com/pquerna/ctail
url :
	 https://github.com/pquerna/ctail/archive/ctail-0.1.0.tar.gz
description :
	 Tool for operating tail across large clusters of machines
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 apr
	 apr-util
optional_deps :
conflicts :
	 byobu
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure",
	 "--prefix=#{prefix}",
	 "--disable-debug",
	 "--with-apr=#{Formula["apr"].opt_bin}",
	 "--with-apr-util=#{Formula["apr-util"].opt_bin}"
	 system "make", "LIBTOOL=glibtool --tag=CC"
	 system "make", "install"
