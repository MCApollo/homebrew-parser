name :
	 Libetpan
homepage :
	 https://www.etpan.org/libetpan.html
url :
	 https://github.com/dinhviethoa/libetpan/archive/1.9.1.tar.gz
description :
	 Portable mail library handling several protocols
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
