name :
	 Libbinio
homepage :
	 https://libbinio.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/libbinio/libbinio/1.4/libbinio-1.4.tar.bz2
description :
	 Binary I/O stream class library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
