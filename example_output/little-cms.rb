name :
	 LittleCms
homepage :
	 http://www.littlecms.com/
url :
	 https://downloads.sourceforge.net/project/lcms/lcms/1.19/lcms-1.19.tar.gz
description :
	 Version 1 of the Little CMS library
build_deps :
link_deps :
	 jpeg
	 libtiff
conflicts :
patches :
EOF_patch :
install :
	 args = %W[--disable-dependency-tracking --disable-debug --prefix=#{prefix}]
	 system "./configure", *args
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
