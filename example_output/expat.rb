name :
	 Expat
homepage :
	 https://libexpat.github.io/
url :
	 https://github.com/libexpat/libexpat/releases/download/R_2_2_6/expat-2.2.6.tar.bz2
description :
	 XML 1.0 parser
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
	 cd "expat" if build.head?
	 system "autoreconf", "-fiv" if build.head?
	 args = ["--prefix=#{prefix}", "--mandir=#{man}"]
	 args << "--with-docbook" if build.head?
	 system "./configure", *args
	 system "make", "install"
