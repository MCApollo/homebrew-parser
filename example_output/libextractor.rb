name :
	 Libextractor
homepage :
	 https://www.gnu.org/software/libextractor/
url :
	 https://ftp.gnu.org/gnu/libextractor/libextractor-1.8.tar.gz
description :
	 Library to extract meta data from files
build_deps :
	 pkg-config
link_deps :
	 libtool
conflicts :
	 pkcrack
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--disable-silent-rules",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
