name :
	 MysqlClient
homepage :
	 https://dev.mysql.com/doc/refman/5.7/en/
url :
	 https://cdn.mysql.com/Downloads/MySQL-5.7/mysql-boost-5.7.23.tar.gz
description :
	 Open source relational database management system
build_deps :
	 cmake
link_deps :
	 :macos
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "CMakeLists.txt", "ADD_SUBDIRECTORY(storage/ndb)", ""
	 args = %W[
	 -DCOMPILATION_COMMENT=Homebrew
	 -DDEFAULT_CHARSET=utf8
	 -DDEFAULT_COLLATION=utf8_general_ci
	 -DINSTALL_DOCDIR=share/doc/#{name}
	 -DINSTALL_INCLUDEDIR=include/mysql
	 -DINSTALL_INFODIR=share/info
	 -DINSTALL_MANDIR=share/man
	 -DINSTALL_MYSQLSHAREDIR=share/mysql
	 -DWITH_BOOST=boost
	 -DWITH_EDITLINE=system
	 -DWITH_SSL=yes
	 -DWITH_UNIT_TESTS=OFF
	 -DWITHOUT_SERVER=ON
	 ]
	 system "cmake", ".", *std_cmake_args, *args
	 system "make", "install"
