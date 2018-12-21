name :
	 Htmldoc
homepage :
	 https://www.msweet.org/htmldoc/
url :
	 https://github.com/michaelrsweet/htmldoc/releases/download/v1.9.4/htmldoc-1.9.4-source.tar.gz
description :
	 Convert HTML to PDF or PostScript
build_deps :
link_deps :
	 jpeg
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-ssl",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"
