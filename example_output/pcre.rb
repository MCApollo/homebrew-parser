name :
	 Pcre
homepage :
	 https://www.pcre.org/
url :
	 https://ftp.pcre.org/pub/pcre/pcre-8.42.tar.bz2
description :
	 Perl compatible regular expressions library
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-utf8",
	 "--enable-pcre8",
	 "--enable-pcre16",
	 "--enable-pcre32",
	 "--enable-unicode-properties",
	 "--enable-pcregrep-libz",
	 "--enable-pcregrep-libbz2",
	 "--enable-jit"
	 system "make"
	 ENV.deparallelize
	 system "make", "test"
	 system "make", "install"
