name :
	 Redland
homepage :
	 http://librdf.org/
url :
	 http://download.librdf.org/source/redland-1.0.17.tar.gz
description :
	 RDF Library
build_deps :
	 pkg-config
link_deps :
	 raptor
	 rasqal
	 sqlite
	 unixodbc
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-bdb=no",
	 "--with-mysql=no",
	 "--with-sqlite=yes"
	 system "make", "install"
