name :
	 JsonTable
homepage :
	 https://github.com/micha/json-table
url :
	 https://github.com/micha/json-table/archive/4.3.3.tar.gz
description :
	 Transform nested JSON data into tabular data in the shell
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
