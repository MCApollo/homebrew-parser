name :
	 Argtable
homepage :
	 https://argtable.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13/argtable2-13.tar.gz
description :
	 ANSI C library for parsing GNU-style command-line options
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
