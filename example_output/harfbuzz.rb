name :
	 Harfbuzz
homepage :
	 https://wiki.freedesktop.org/www/Software/HarfBuzz/
url :
	 https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.2.0.tar.bz2
description :
	 OpenType text shaping engine
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 cairo
	 freetype
	 glib
	 graphite2
	 icu4c
optional_deps :
conflicts :
resource :
	 ['ttf']
	 ['https://github.com/behdad/harfbuzz/raw/fc0daafab0336b847ac14682e581a8838f36a0bf/test/shaping/fonts/sha1sum/270b89df543a7e48e206a2d830c0e10e5265c630.ttf']
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-introspection=yes
	 --enable-static
	 --with-cairo=yes
	 --with-coretext=yes
	 --with-freetype=yes
	 --with-glib=yes
	 --with-gobject=yes
	 --with-graphite2=yes
	 --with-icu=yes
	 ]
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
