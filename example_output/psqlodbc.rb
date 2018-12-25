name :
	 Psqlodbc
homepage :
	 https://odbc.postgresql.org
url :
	 https://ftp.postgresql.org/pub/odbc/versions/src/psqlodbc-10.03.0000.tar.gz
description :
	 Official PostgreSQL ODBC driver
build_deps :
link_deps :
	 openssl
	 postgresql
	 unixodbc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--with-unixodbc=#{Formula["unixodbc"].opt_prefix}"
	 system "make"
	 system "make", "install"
