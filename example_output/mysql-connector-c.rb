name :
	 MysqlConnectorC
homepage :
	 https://dev.mysql.com/downloads/connector/c/
url :
	 https://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.1.11-src.tar.gz
description :
	 MySQL database connector for C applications
build_deps :
	 cmake
link_deps :
	 openssl
conflicts :
	 mysql
	 mariadb
	 percona-server
	 mysql-cluster
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DWITH_SSL=system", *std_cmake_args
	 system "make", "install"
