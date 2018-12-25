name :
	 Fuego
homepage :
	 https://fuego.sourceforge.io/
url :
	 http://svn.code.sf.net/p/fuego/code/trunk
description :
	 Collection of C++ libraries for the game of Go
build_deps :
	 autoconf
	 automake
link_deps :
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-boost=#{Formula["boost"].opt_prefix}"
	 system "make", "install"
