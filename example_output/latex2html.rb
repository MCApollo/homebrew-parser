name :
	 Latex2html
homepage :
	 https://www.ctan.org/pkg/latex2html
url :
	 http://mirrors.ctan.org/support/latex2html/latex2html-2018.tar.gz
description :
	 LaTeX-to-HTML translator
build_deps :
link_deps :
	 ghostscript
	 netpbm
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--without-mktexlsr",
	 "--with-texpath=#{share}/texmf/tex/latex/html"
	 system "make", "install"
