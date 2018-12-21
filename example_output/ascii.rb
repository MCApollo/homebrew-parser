name :
	 Ascii
homepage :
	 http://www.catb.org/~esr/ascii/
url :
	 http://www.catb.org/~esr/ascii/ascii-3.18.tar.gz
description :
	 List ASCII idiomatic names and octal/decimal code-point forms
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog" if build.head?
	 bin.mkpath
	 man1.mkpath
	 system "make"
	 system "make", "PREFIX=#{prefix}", "install"
