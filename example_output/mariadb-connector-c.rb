name :
	 MariadbConnectorC
homepage :
	 https://downloads.mariadb.org/connector-c/
url :
	 https://downloads.mariadb.org/f/connector-c-3.0.3/mariadb-connector-c-3.0.3-src.tar.gz
description :
	 MariaDB database connector for C applications
build_deps :
	 cmake
link_deps :
	 openssl
optional_deps :
conflicts :
	 mysql
	 mariadb
	 percona-server
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DWITH_OPENSSL=On"
	 args << "-DOPENSSL_INCLUDE_DIR=#{Formula["openssl"].opt_include}"
	 args << "-DCOMPILATION_COMMENT=Homebrew"
	 system "cmake", ".", *args
	 system "make", "install"
