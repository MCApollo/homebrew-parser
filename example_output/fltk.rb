name :
	 Fltk
homepage :
	 https://www.fltk.org/
url :
	 https://www.fltk.org/pub/fltk/1.3.4/fltk-1.3.4-2-source.tar.gz
description :
	 Cross-platform C++ GUI toolkit
build_deps :
link_deps :
	 jpeg
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-threads",
	 "--enable-shared"
	 system "make", "install"
