name :
	 Libpq
homepage :
	 https://www.postgresql.org/docs/11/static/libpq.html
url :
	 https://ftp.postgresql.org/pub/source/v11.1/postgresql-11.1.tar.bz2
description :
	 Postgres C API library
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--with-openssl"
	 system "make"
	 system "make", "-C", "src/bin", "install"
	 system "make", "-C", "src/include", "install"
	 system "make", "-C", "src/interfaces", "install"
	 system "make", "-C", "doc", "install"
