name :
	 Rasqal
homepage :
	 http://librdf.org/rasqal/
url :
	 http://download.librdf.org/source/rasqal-0.9.33.tar.gz
description :
	 RDF query library
build_deps :
	 pkg-config
link_deps :
	 raptor
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-html-dir=#{share}/doc",
	 "--disable-dependency-tracking"
	 system "make", "install"
