name :
	 LittleCms2
homepage :
	 http://www.littlecms.com/
url :
	 https://downloads.sourceforge.net/project/lcms/lcms/2.9/lcms2-2.9.tar.gz
description :
	 Color management engine supporting ICC profiles
build_deps :
link_deps :
	 jpeg
	 libtiff
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[--disable-dependency-tracking --prefix=#{prefix}]
	 system "./configure", *args
	 system "make", "install"
