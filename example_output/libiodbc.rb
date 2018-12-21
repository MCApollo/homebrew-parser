name :
	 Libiodbc
homepage :
	 http://www.iodbc.org/dataspace/iodbc/wiki/iODBC/
url :
	 https://downloads.sourceforge.net/project/iodbc/iodbc/3.52.12/libiodbc-3.52.12.tar.gz
description :
	 Database connectivity layer based on ODBC. (alternative to unixodbc)
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
