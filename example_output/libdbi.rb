name :
	 Libdbi
homepage :
	 https://libdbi.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/libdbi/libdbi/libdbi-0.9.0/libdbi-0.9.0.tar.gz
description :
	 Database-independent abstraction layer in C, similar to DBI/DBD in Perl
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--prefix=#{prefix}"
	 system "make", "install"
