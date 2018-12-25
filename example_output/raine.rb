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
optional_deps :
conflicts :
resource :
	 ['gettext', 'libpng', 'sdl', 'sdl_image', 'libogg', 'libvorbis', 'flac', 'sdl_sound', 'freetype', 'sdl_ttf', 'muparser']
	 ['https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz', 'https://downloads.sourceforge.net/project/libpng/libpng16/older-releases/1.6.31/libpng-1.6.31.tar.xz', 'https://www.libsdl.org/release/SDL-1.2.15.tar.gz', 'https://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.12.tar.gz', 'https://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz', 'https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.5.tar.xz', 'https://downloads.xiph.org/releases/flac/flac-1.3.2.tar.xz', 'https://icculus.org/SDL_sound/downloads/SDL_sound-1.0.3.tar.gz', 'https://downloads.sourceforge.net/project/freetype/freetype2/2.8/freetype-2.8.tar.bz2', 'https://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-2.0.11.tar.gz', 'https://github.com/beltoforion/muparser/archive/v2.2.5.tar.gz']
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
	 end
	 inreplace "makefile" do |s|
	 s.gsub! /-lSDL_ttf/, "-lSDL_ttf -lfreetype -lbz2"
	 s.gsub! /-lSDL_sound/, "-lSDL_sound -lFLAC -logg"
	 s.gsub! /-l(SDL\w*|intl|muparser|freetype|png|FLAC|ogg)/, "#{buildpath}/lib/lib\\1.a"
	 s.gsub! %r{/usr/local/lib/libpng.a}, "#{buildpath}/lib/libpng.a"
	 s.gsub! %r{/usr/local/include/SDL/}, "#{buildpath}/include/SDL/"
	 s.gsub! %r{-I/usr/local/include}, ENV.cflags
	 end
	 frameworks = %w[ApplicationServices AppKit AudioToolbox AudioUnit Carbon
	 CoreFoundation CoreGraphics CoreServices Foundation IOKit]
	 system "make", "LD=#{ENV.cxx} #{ENV.ldflags} #{frameworks.map { |f| "-framework #{f}" }.join(" ")}"
	 system "make", "install"
	 prefix.install "Raine.app"
	 bin.write_exec_script "#{prefix}/Raine.app/Contents/MacOS/raine"
