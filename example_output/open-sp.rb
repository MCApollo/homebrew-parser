name :
	 OpenSp
homepage :
	 https://openjade.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/openjade/opensp/1.5.2/OpenSP-1.5.2.tar.gz
description :
	 SGML parser
build_deps :
	 docbook
	 ghostscript
	 xmlto
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--enable-http",
	 "--enable-default-catalog=#{etc}/sgml/catalog"
	 system "make", "pkgdatadir=#{share}/sgml/opensp", "install"
