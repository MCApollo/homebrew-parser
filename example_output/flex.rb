name :
	 Flex
homepage :
	 https://github.com/westes/flex
url :
	 https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
description :
	 Fast Lexical Analyzer, generates Scanners (tokenizers)
build_deps :
	 help2man
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 ENV.prepend_path "PATH", Formula["gnu-sed"].opt_libexec/"gnubin"
	 system "./autogen.sh"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--enable-shared",
	 "--prefix=#{prefix}"
	 system "make", "install"
