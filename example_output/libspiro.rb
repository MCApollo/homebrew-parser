name :
	 Libspiro
homepage :
	 https://github.com/fontforge/libspiro
url :
	 https://github.com/fontforge/libspiro/releases/download/0.5.20150702/libspiro-0.5.20150702.tar.gz
description :
	 Library to simplify the drawing of curves
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 system "autoreconf", "-i"
	 system "automake"
	 end
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
