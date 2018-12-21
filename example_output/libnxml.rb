name :
	 Libnxml
homepage :
	 https://www.autistici.org/bakunin/libnxml/
url :
	 https://www.autistici.org/bakunin/libnxml/libnxml-0.18.3.tar.gz
description :
	 C library for parsing, writing, and creating XML files
build_deps :
link_deps :
	 curl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
