name :
	 Pdfgrep
homepage :
	 https://pdfgrep.org/
url :
	 https://pdfgrep.org/download/pdfgrep-2.1.1.tar.gz
description :
	 Search PDFs for strings matching a regular expression
build_deps :
	 pkg-config
link_deps :
	 libgcrypt
	 poppler
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./autogen.sh" if build.head?
	 args = %W[--disable-dependency-tracking --prefix=#{prefix}]
	 args << "--without-libpcre" if build.without? "pcre"
	 system "./configure", *args
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "make", "install"
