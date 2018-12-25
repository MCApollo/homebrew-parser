name :
	 Powerman
homepage :
	 https://code.google.com/p/powerman/
url :
	 https://github.com/chaos/powerman/releases/download/2.3.24/powerman-2.3.24.tar.gz
description :
	 Control (remotely and in parallel) switched power distribution units
build_deps :
link_deps :
	 curl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--with-httppower",
	 "--with-ncurses",
	 "--without-genders",
	 "--without-snmppower",
	 "--without-tcp-wrappers"
	 system "make", "install"
