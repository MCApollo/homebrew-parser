name :
	 Libmrss
homepage :
	 https://www.autistici.org/bakunin/libmrss/
url :
	 https://www.autistici.org/bakunin/libmrss/libmrss-0.19.2.tar.gz
description :
	 C library for RSS files or streams
build_deps :
	 pkg-config
link_deps :
	 libnxml
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
