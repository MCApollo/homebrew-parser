name :
	 Libpqxx
homepage :
	 http://pqxx.org/development/libpqxx/
url :
	 https://github.com/jtv/libpqxx/archive/6.2.5.tar.gz
description :
	 C++ connector for PostgreSQL
build_deps :
	 pkg-config
	 xmlto
link_deps :
	 postgresql
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--enable-shared"
	 system "make", "install"
