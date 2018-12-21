name :
	 Libav
homepage :
	 https://libav.org/
url :
	 https://libav.org/releases/libav-12.3.tar.xz
description :
	 Audio and video processing tools
build_deps :
	 pkg-config
	 yasm
link_deps :
	 texi2html
	 faac
	 fdk-aac
	 freetype
	 lame
	 libvorbis
	 libvpx
	 opus
	 x264
	 xvid
	 openssl
	 sdl
	 theora
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/b6e917c/libav/Check-for--no_weak_imports-in-ldflags-on-macOS.patch
	 https://github.com/libav/libav/commit/141c960e21d2860e354f9b90df136184dd00a9a8.patch?full_index=1
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-shared
	 --disable-indev=jack
	 --prefix=#{prefix}
	 --cc=#{ENV.cc}
	 --host-cflags=#{ENV.cflags}
	 --host-ldflags=#{ENV.ldflags}
	 --enable-gpl
	 --enable-libfaac
	 --enable-libfdk-aac
	 --enable-libfreetype
	 --enable-libmp3lame
	 --enable-libopus
	 --enable-libvorbis
	 --enable-libvpx
	 --enable-libx264
	 --enable-libxvid
	 --enable-nonfree
	 --enable-vda
	 --enable-version3
	 ]
	 args << "--enable-libtheora" if build.with? "theora"
	 args << "--enable-openssl" if build.with? "openssl"
	 system "./configure", *args
	 system "make"
	 bin.install "avconv", "avprobe"
	 man1.install "doc/avconv.1", "doc/avprobe.1"
	 if build.with? "sdl"
	 bin.install "avplay"
	 man1.install "doc/avplay.1"
