name :
	 Dbhash
homepage :
	 https://www.sqlite.org/dbhash.html
url :
	 https://sqlite.org/2018/sqlite-src-3260000.zip
description :
	 Computes the SHA1 hash of schema and content of a SQLite database
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--prefix=#{prefix}"
	 system "make", "dbhash"
	 bin.install "dbhash"
