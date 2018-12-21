name :
	 Libgetdata
homepage :
	 https://getdata.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/getdata/getdata/0.10.0/getdata-0.10.0.tar.xz
description :
	 Reference implementation of the Dirfile Standards
build_deps :
link_deps :
	 libtool
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-fortran",
	 "--disable-fortran95",
	 "--disable-php",
	 "--disable-python",
	 "--without-liblzma",
	 "--without-libzzip"
	 system "make"
	 system "make", "install"
