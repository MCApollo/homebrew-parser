name :
	 Freeciv
homepage :
	 https://freeciv.wikia.com/
url :
	 https://downloads.sourceforge.net/project/freeciv/Freeciv%202.6/2.6.0/freeciv-2.6.0.tar.bz2
description :
	 Free and Open Source empire-building strategy game
build_deps :
	 pkg-config
link_deps :
	 atk
	 freetype
	 gettext
	 glib
	 gtk+
	 icu4c
	 pango
	 readline
	 sdl
	 sdl_gfx
	 sdl_image
	 sdl_mixer
	 sdl_ttf
conflicts :
patches :
EOF_patch :
install :
	 ENV["ac_cv_lib_lzma_lzma_code"] = "no"
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-gtktest
	 --prefix=#{prefix}
	 --with-readline=#{Formula["readline"].opt_prefix}
	 CFLAGS=-I#{Formula["gettext"].include}
	 LDFLAGS=-L#{Formula["gettext"].lib}
	 ]
	 if build.head?
	 inreplace "./autogen.sh", "libtoolize", "glibtoolize"
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
