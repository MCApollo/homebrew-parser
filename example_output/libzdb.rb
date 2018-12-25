name :
	 Libzdb
homepage :
	 https://tildeslash.com/libzdb/
url :
	 https://tildeslash.com/libzdb/dist/libzdb-3.1.tar.gz
description :
	 Database connection pool library
build_deps :
link_deps :
	 mysql-client
	 openssl
	 postgresql
	 sqlite
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
