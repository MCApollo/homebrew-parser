name :
	 Imlib2
homepage :
	 https://sourceforge.net/projects/enlightenment/
url :
	 https://downloads.sourceforge.net/project/enlightenment/imlib2-src/1.5.1/imlib2-1.5.1.tar.bz2
description :
	 Image loading and rendering library
build_deps :
	 pkg-config
link_deps :
	 freetype
	 giflib
	 jpeg
	 libpng
	 libtiff
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-amd64=no
	 --without-id3
	 ]
	 args << "--without-x" if build.without? "x11"
	 system "./configure", *args
	 system "make", "install"
