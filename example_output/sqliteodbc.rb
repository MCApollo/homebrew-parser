name :
	 Sqliteodbc
homepage :
	 https://ch-werner.homepage.t-online.de/sqliteodbc/
url :
	 https://ch-werner.homepage.t-online.de/sqliteodbc/sqliteodbc-0.9996.tar.gz
description :
	 SQLite ODBC driver
build_deps :
link_deps :
	 sqlite
	 unixodbc
conflicts :
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 lib.mkdir
	 system "./configure", "--prefix=#{prefix}", "--with-odbc=#{Formula["unixodbc"].opt_prefix}", "--with-sqlite3=#{Formula["sqlite"].opt_prefix}"
	 system "make"
	 system "make", "install"
	 lib.install_symlink "#{lib}/libsqlite3odbc.dylib" => "libsqlite3odbc.so"
