name :
	 Raptor
homepage :
	 http://librdf.org/raptor/
url :
	 http://download.librdf.org/source/raptor2-2.0.15.tar.gz
description :
	 RDF parser toolkit
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
