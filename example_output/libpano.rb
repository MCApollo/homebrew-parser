name :
	 Libpano
homepage :
	 https://panotools.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/panotools/libpano13/libpano13-2.9.19/libpano13-2.9.19.tar.gz
description :
	 Build panoramic images from a set of overlapping images
build_deps :
link_deps :
	 jpeg
	 libpng
	 libtiff
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
