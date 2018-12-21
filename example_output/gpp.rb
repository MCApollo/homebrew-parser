name :
	 Gpp
homepage :
	 https://logological.org/gpp
url :
	 https://files.nothingisreal.com/software/gpp/gpp-2.25.tar.bz2
description :
	 General-purpose preprocessor with customizable syntax
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
