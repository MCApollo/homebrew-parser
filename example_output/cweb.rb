name :
	 Cweb
homepage :
	 https://cs.stanford.edu/~knuth/cweb.html
url :
	 https://cs.stanford.edu/pub/cweb/cweb-3.64b.tar.gz
description :
	 Literate documentation system for C, C++, and Java
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 macrosdir = share/"texmf/tex/generic"
	 cwebinputs = lib/"cweb"
	 [bin, man1, macrosdir, elisp, cwebinputs].each(&:mkpath)
	 system "make", "install",
	 "DESTDIR=#{bin}/",
	 "MANDIR=#{man1}",
	 "MANEXT=1",
	 "MACROSDIR=#{macrosdir}",
	 "EMACSDIR=#{elisp}",
	 "CWEBINPUTS=#{cwebinputs}"
