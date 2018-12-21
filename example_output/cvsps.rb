name :
	 Cvsps
homepage :
	 http://www.catb.org/~esr/cvsps/
url :
	 http://www.catb.org/~esr/cvsps/cvsps-3.13.tar.gz
description :
	 Create patchset information from CVS
build_deps :
link_deps :
	 asciidoc
	 docbook
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 system "make", "all", "cvsps.1"
	 system "make", "install", "prefix=#{prefix}"
