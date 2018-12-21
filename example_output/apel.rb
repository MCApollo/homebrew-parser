name :
	 Apel
homepage :
	 http://git.chise.org/elisp/apel/
url :
	 http://git.chise.org/elisp/dist/apel/apel-10.8.tar.gz
description :
	 Emacs Lisp library to help write portable Emacs programs
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}",
	 "LISPDIR=#{elisp}", "VERSION_SPECIFIC_LISPDIR=#{elisp}"
