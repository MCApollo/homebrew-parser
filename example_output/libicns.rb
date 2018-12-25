name :
	 Libicns
homepage :
	 https://icns.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/icns/libicns-0.8.1.tar.gz
description :
	 Library for manipulation of the macOS .icns resource format
build_deps :
link_deps :
	 jasper
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "icnsutils/png2icns.c",
	 "png_set_gray_1_2_4_to_8",
	 "png_set_expand_gray_1_2_4_to_8"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
