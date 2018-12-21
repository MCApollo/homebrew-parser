name :
	 Qdbm
homepage :
	 https://fallabs.com/qdbm/
url :
	 https://fallabs.com/qdbm/qdbm-1.8.78.tar.gz
description :
	 Library of routines for managing a database
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--enable-bzip",
	 "--enable-zlib",
	 "--enable-iconv"
	 system "make", "mac"
	 system "make", "check-mac"
	 system "make", "install-mac"
