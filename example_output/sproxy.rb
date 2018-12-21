name :
	 Sproxy
homepage :
	 https://www.joedog.org/sproxy-home/
url :
	 http://download.joedog.org/sproxy/sproxy-1.02.tar.gz
description :
	 HTTP proxy server collecting URLs in a 'siege-friendly' manner
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "doc/Makefile.am", "$(prefix)/man", "$(mandir)"
	 inreplace "lib/Makefile.am", "Makefile.PL", "Makefile.PL PREFIX=$(prefix)"
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
