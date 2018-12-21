name :
	 Docbook2x
homepage :
	 https://docbook2x.sourceforge.io/
url :
	 https://downloads.sourceforge.net/docbook2x/docbook2X-0.8.8.tar.gz
description :
	 Convert DocBook to UNIX manpages and GNU TeXinfo
build_deps :
link_deps :
	 docbook
conflicts :
patches :
EOF_patch :
install :
	 inreplace "perl/db2x_xsltproc.pl", "http://docbook2x.sf.net/latest/xslt", "#{share}/docbook2X/xslt"
	 inreplace "configure", "${prefix}", prefix
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
