name :
	 Sqldiff
homepage :
	 https://www.sqlite.org/sqldiff.html
url :
	 https://sqlite.org/2018/sqlite-src-3260000.zip
description :
	 Displays the differences between SQLite databases
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
	 system "make", "sqldiff"
	 bin.install "sqldiff"
