name :
	 Libxslt
homepage :
	 http://xmlsoft.org/XSLT/
url :
	 http://xmlsoft.org/sources/libxslt-1.1.32.tar.gz
description :
	 C XSLT library for GNOME
build_deps :
link_deps :
	 libxml2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv" if build.head?
	 inreplace "configure", /PYTHON_LIBS=.*/, 'PYTHON_LIBS="-undefined dynamic_lookup"'
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-libxml-prefix=#{Formula["libxml2"].opt_prefix}"
	 system "make"
	 system "make", "install"
