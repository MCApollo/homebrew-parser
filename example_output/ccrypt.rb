name :
	 Ccrypt
homepage :
	 https://ccrypt.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ccrypt/1.11/ccrypt-1.11.tar.gz
description :
	 Encrypt and decrypt files and streams
build_deps :
link_deps :
conflicts :
	 ccat
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-lispdir=#{share}/emacs/site-lisp/ccrypt"
	 system "make", "install"
	 system "make", "check"
