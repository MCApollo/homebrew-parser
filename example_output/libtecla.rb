name :
	 Libtecla
homepage :
	 http://www.astro.caltech.edu/~mcs/tecla/index.html
url :
	 http://www.astro.caltech.edu/~mcs/tecla/libtecla-1.6.3.tar.gz
description :
	 Command-line editing facilities similar to the tcsh shell
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
