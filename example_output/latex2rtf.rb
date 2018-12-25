name :
	 Latex2rtf
homepage :
	 https://latex2rtf.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/latex2rtf/latex2rtf-unix/2.3.17/latex2rtf-2.3.17.tar.gz
description :
	 Translate LaTeX to RTF
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
	 inreplace "Makefile", "cp -p doc/latex2rtf.html $(DESTDIR)$(SUPPORTDIR)", "cp -p doc/web/* $(DESTDIR)$(SUPPORTDIR)"
	 system "make", "DESTDIR=",
	 "BINDIR=#{bin}",
	 "MANDIR=#{man1}",
	 "INFODIR=#{info}",
	 "SUPPORTDIR=#{pkgshare}",
	 "CFGDIR=#{pkgshare}/cfg",
	 "install"
	 end
