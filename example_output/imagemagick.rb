name :
	 Imagemagick
homepage :
	 https://www.imagemagick.org/
url :
	 https://dl.bintray.com/homebrew/mirror/ImageMagick-7.0.8-16.tar.xz
description :
	 Tools and libraries to manipulate images in many formats
build_deps :
	 pkg-config
link_deps :
	 freetype
	 jpeg
	 libpng
	 libtiff
	 libtool
	 little-cms2
	 openjpeg
	 webp
	 xz
optional_deps :
	 fftw
	 fontconfig
	 ghostscript
	 libheif
	 liblqr
	 librsvg
	 libwmf
	 little-cms
	 openexr
	 pango
	 perl
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-osx-universal-binary
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --disable-opencl
	 --disable-openmp
	 --enable-shared
	 --enable-static
	 --with-freetype=yes
	 --with-modules
	 --with-openjp2
	 --with-webp=yes
	 ]
	 args << "--without-gslib" if build.without? "ghostscript"
	 args << "--with-perl" << "--with-perl-options='PREFIX=#{prefix}'" if build.with? "perl"
	 args << "--with-gs-font-dir=#{HOMEBREW_PREFIX}/share/ghostscript/fonts" if build.without? "ghostscript"
	 args << "--enable-hdri=yes" if build.with? "hdri"
	 args << "--without-fftw" if build.without? "fftw"
	 args << "--without-pango" if build.without? "pango"
	 args << "--with-rsvg" if build.with? "librsvg"
	 args << "--without-x" if build.without? "x11"
	 args << "--with-fontconfig=yes" if build.with? "fontconfig"
	 args << "--without-wmf" if build.without? "libwmf"
	 inreplace "configure", "${PACKAGE_NAME}-${PACKAGE_VERSION}", "${PACKAGE_NAME}"
	 system "./configure", *args
	 system "make", "install"
