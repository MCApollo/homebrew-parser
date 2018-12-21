name :
	 Libpuzzle
homepage :
	 https://www.pureftpd.org/project/libpuzzle
url :
	 https://download.pureftpd.org/pub/pure-ftpd/misc/libpuzzle/releases/libpuzzle-0.11.tar.bz2
description :
	 Library to find visually similar images
build_deps :
link_deps :
	 gd
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
