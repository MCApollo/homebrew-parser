name :
	 Freetds
homepage :
	 http://www.freetds.org/
url :
	 http://www.freetds.org/files/stable/freetds-1.00.109.tar.gz
description :
	 Libraries to talk to Microsoft SQL Server and Sybase databases
build_deps :
	 pkg-config
link_deps :
	 openssl
	 unixodbc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --with-tdsver=7.3
	 --mandir=#{man}
	 --sysconfdir=#{etc}
	 --with-unixodbc=#{Formula["unixodbc"].opt_prefix}
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 --enable-sybase-compat
	 --enable-krb5
	 --enable-odbc-wide
	 ]
	 if build.with? "msdblib"
	 args << "--enable-msdblib"
	 end
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
