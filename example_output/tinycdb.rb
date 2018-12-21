name :
	 Tinycdb
homepage :
	 http://www.corpit.ru/mjt/tinycdb.html
url :
	 http://www.corpit.ru/mjt/tinycdb/tinycdb-0.78.tar.gz
description :
	 Create and read constant databases
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "prefix=#{prefix}", "mandir=#{man}"
