name :
	 MysqlConnectorCxx
homepage :
	 https://dev.mysql.com/downloads/connector/cpp/
url :
	 https://cdn.mysql.com/Downloads/Connector-C++/mysql-connector-c++-1.1.9.tar.gz
description :
	 MySQL database connector for C++ applications
build_deps :
	 boost
	 cmake
link_deps :
	 mysql-client
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
