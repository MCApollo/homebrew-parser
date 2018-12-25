name :
	 Vips
homepage :
	 https://github.com/libvips/libvips
url :
	 https://github.com/libvips/libvips/releases/download/v8.7.2/vips-8.7.2.tar.gz
description :
	 Image processing library
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 fontconfig
	 gettext
	 giflib
	 glib
	 jpeg
	 libexif
	 libgsf
	 libpng
	 librsvg
	 libtiff
	 little-cms2
	 orc
	 pango
	 webp
	 fftw
	 graphicsmagick
	 poppler
optional_deps :
	 imagemagick
	 openexr
	 openslide
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
	 ]
	 if build.with? "graphicsmagick"
	 args << "--with-magick" << "--with-magickpackage=GraphicsMagick"
	 elsif build.with? "imagemagick"
	 args << "--with-magick"
	 end
	 system "./configure", *args
	 system "make", "install"
