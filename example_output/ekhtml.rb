name :
	 Ekhtml
homepage :
	 https://ekhtml.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ekhtml/ekhtml/0.3.2/ekhtml-0.3.2.tar.gz
description :
	 Forgiving SAX-style HTML parser
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
