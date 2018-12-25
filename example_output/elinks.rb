name :
	 Elinks
homepage :
	 http://elinks.or.cz/
url :
	 http://elinks.or.cz/download/elinks-0.11.7.tar.bz2
description :
	 Text mode web browser
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.delete("LD")
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--without-spidermonkey",
	 "--enable-256-colors"
	 system "make", "install"
