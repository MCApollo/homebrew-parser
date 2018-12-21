name :
	 Graphicsmagick
homepage :
	 http://www.graphicsmagick.org/
url :
	 https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.31/GraphicsMagick-1.3.31.tar.xz
description :
	 Image processing tools collection
build_deps :
	 pkg-config
link_deps :
	 freetype
	 jasper
	 jpeg
	 libpng
	 libtiff
	 libtool
	 ghostscript
	 libwmf
	 little-cms2
	 webp
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --enable-shared
	 --disable-static
	 --with-modules
	 --without-lzma
	 --disable-openmp
	 --with-quantum-depth=16
	 ]
	 args << "--without-gslib" if build.without? "ghostscript"
	 args << "--with-gs-font-dir=#{HOMEBREW_PREFIX}/share/ghostscript/fonts" if build.without? "ghostscript"
	 args << "--with-perl" if build.with? "perl"
	 args << "--with-webp=no" if build.without? "webp"
	 args << "--without-x" if build.without? "x11"
	 args << "--without-lcms2" if build.without? "little-cms2"
	 args << "--without-wmf" if build.without? "libwmf"
	 inreplace "configure", "${PACKAGE_NAME}-${PACKAGE_VERSION}", "${PACKAGE_NAME}"
	 system "./configure", *args
	 system "make", "install"
	 if build.with? "perl"
	 cd "PerlMagick" do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{prefix}"
	 system "make"
	 system "make", "install"
