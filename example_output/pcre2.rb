name :
	 Pcre2
homepage :
	 https://www.pcre.org/
url :
	 https://ftp.pcre.org/pub/pcre/pcre2-10.32.tar.bz2
description :
	 Perl compatible regular expressions library with a new API
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-pcre2-16",
	 "--enable-pcre2-32",
	 "--enable-pcre2grep-libz",
	 "--enable-pcre2grep-libbz2",
	 "--enable-jit"
	 system "make"
	 system "make", "install"
