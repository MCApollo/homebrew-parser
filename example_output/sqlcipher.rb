name :
	 Sqlcipher
homepage :
	 https://www.zetetic.net/sqlcipher/
url :
	 https://github.com/sqlcipher/sqlcipher/archive/v4.0.0.tar.gz
description :
	 SQLite extension providing 256-bit AES encryption
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --enable-tempstore=yes
	 --with-crypto-lib=#{Formula["openssl"].opt_prefix}
	 --enable-load-extension
	 --disable-tcl
	 ]
	 args << "CFLAGS=-DSQLITE_HAS_CODEC -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_FTS5"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
