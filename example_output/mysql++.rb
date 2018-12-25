name :
	 Mysqlxx
homepage :
	 https://tangentsoft.com/mysqlpp/home
url :
	 https://tangentsoft.com/mysqlpp/releases/mysql++-3.2.3.tar.gz
description :
	 C++ wrapper for MySQL's C API
build_deps :
link_deps :
	 mysql-client
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mysql = Formula["mysql-client"]
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-field-limit=40",
	 "--with-mysql-lib=#{mysql.opt_lib}",
	 "--with-mysql-include=#{mysql.opt_include}/mysql"
	 system "make", "install"
