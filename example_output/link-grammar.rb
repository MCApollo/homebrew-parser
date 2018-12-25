name :
	 LinkGrammar
homepage :
	 https://www.abisource.com/projects/link-grammar/
url :
	 https://www.abisource.com/downloads/link-grammar/5.5.1/link-grammar-5.5.1.tar.gz
description :
	 Carnegie Mellon University's link grammar parser
build_deps :
	 ant
	 autoconf
	 autoconf-archive
	 automake
	 libtool
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["PYTHON_LIBS"] = "-undefined dynamic_lookup"
	 inreplace "bindings/python/Makefile.am",
	 "$(PYTHON2_LDFLAGS) -module -no-undefined",
	 "$(PYTHON2_LDFLAGS) -module"
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
