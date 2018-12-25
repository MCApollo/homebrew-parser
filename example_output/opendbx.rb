name :
	 Opendbx
homepage :
	 https://linuxnetworks.de/doc/index.php/OpenDBX
url :
	 https://linuxnetworks.de/opendbx/download/opendbx-1.4.6.tar.gz
description :
	 Lightweight but extensible database access library in C
build_deps :
link_deps :
	 readline
	 sqlite
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "utils/Makefile.in", "$(LIBSUFFIX)", ".dylib"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-backends=sqlite3"
	 system "make"
	 system "make", "install"
