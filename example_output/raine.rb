name :
	 Raine
homepage :
	 https://raine.1emulation.com/
url :
	 https://github.com/zelurker/raine/archive/0.64.15.tar.gz
description :
	 680x0 arcade emulator
build_deps :
	 autoconf
	 automake
	 libtool
	 nasm
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.m32
	 ENV.prepend_create_path "PATH", buildpath/"bin"
	 ENV.append_to_cflags "-I#{buildpath}/include"
	 ENV.append "LDFLAGS", "-L#{buildpath}/lib"
	 ENV.prepend_path "PKG_CONFIG_PATH", buildpath/"lib/pkgconfig"
	 resources.each do |r|
	 r.stage do
	 if r.name == "sdl"
	 inreplace "src/video/quartz/SDL_QuartzVideo.h",
	 /(CGDirectPaletteRef.+)$/,
	 "#if (MAC_OS_X_VERSION_MIN_REQUIRED < 1070)\n\\1\n#endif"
	 elsif r.name == "sdl_ttf"
	 inreplace "SDL_ttf.c",
	 "for ( row = 0; row < glyph->bitmap.rows; ++row ) {",
	 "for ( row = 0; row < glyph->pixmap.rows; ++row ) {"
	 elsif r.name == "sdl_sound"
	 touch ["AUTHORS", "NEWS"]
	 File.rename "CHANGELOG", "ChangeLog"
	 system "autoreconf", "-ivf"
	 end
	 args = configure_args(r.name)
	 args << "--prefix=#{buildpath}"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 end
