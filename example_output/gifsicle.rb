name :
	 Gifsicle
homepage :
	 https://www.lcdf.org/gifsicle/
url :
	 https://www.lcdf.org/gifsicle/gifsicle-1.91.tar.gz
description :
	 GIF image/animation creator/editor
build_deps :
link_deps :
optional_deps :
	 :x11
conflicts :
	 giflossy
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 args << "--disable-gifview" if build.without? "x11"
	 system "./bootstrap.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
