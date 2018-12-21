name :
	 Iat
homepage :
	 https://sourceforge.net/projects/iat.berlios/
url :
	 https://downloads.sourceforge.net/project/iat.berlios/iat-0.1.7.tar.bz2
description :
	 Converts many CD-ROM image formats to ISO9660
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}",
	 "--includedir=#{include}/iat"
	 system "make", "install"
