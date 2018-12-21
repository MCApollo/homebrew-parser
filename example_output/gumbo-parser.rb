name :
	 GumboParser
homepage :
	 https://github.com/google/gumbo-parser
url :
	 https://github.com/google/gumbo-parser/archive/v0.10.1.tar.gz
description :
	 C99 library for parsing HTML5
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
