name :
	 MariadbConnectorOdbc
homepage :
	 https://downloads.mariadb.org/connector-odbc/
url :
	 https://downloads.mariadb.org/f/connector-odbc-3.0.2/mariadb-connector-odbc-3.0.2-ga-src.tar.gz
description :
	 Database driver using the industry standard ODBC API
build_deps :
	 cmake
link_deps :
	 mariadb-connector-c
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
	 system "cmake", ".", "-DMARIADB_FOUND=1",
	 "-DWITH_OPENSSL=1",
	 "-DOPENSSL_INCLUDE_DIR=#{Formula["openssl"].opt_include}",
	 *std_cmake_args
	 system "make", "install"
