name :
	 FreetdsAT091
homepage :
	 http://www.freetds.org/
url :
	 http://www.freetds.org/files/stable/freetds-0.91.112.tar.gz
description :
	 Libraries to talk to Microsoft SQL Server & Sybase
build_deps :
	 pkg-config
link_deps :
	 openssl
	 unixodbc
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --enable-krb5
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 --with-tdsver=7.1
	 --with-unixodbc=#{Formula["unixodbc"].opt_prefix}
	 ]
	 system "./configure", *args
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
