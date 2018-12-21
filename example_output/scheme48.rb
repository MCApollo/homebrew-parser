name :
	 Scheme48
homepage :
	 http://www.s48.org/
url :
	 http://s48.org/1.9.2/scheme48-1.9.2.tgz
description :
	 Scheme byte-code interpreter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.O0 if ENV.compiler == :clang
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}", "--enable-gc=bibop"
	 system "make"
	 system "make", "install"
