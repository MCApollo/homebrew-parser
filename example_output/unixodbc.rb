name :
	 Unixodbc
homepage :
	 http://www.unixodbc.org/
url :
	 http://www.unixodbc.org/unixODBC-2.3.7.tar.gz
description :
	 ODBC 3 connectivity for UNIX
build_deps :
link_deps :
	 libtool
conflicts :
	 virtuoso
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--enable-static",
	 "--enable-gui=no"
	 system "make", "install"
