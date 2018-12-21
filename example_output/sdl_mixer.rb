name :
	 SdlMixer
homepage :
	 https://www.libsdl.org/projects/SDL_mixer/
url :
	 https://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.12.tar.gz
description :
	 Sample multi-channel audio mixer library
build_deps :
	 pkg-config
link_deps :
	 libmikmod
	 libogg
	 libvorbis
	 sdl
	 flac
	 fluid-synth
	 smpeg
conflicts :
patches :
EOF_patch :
install :
	 inreplace "SDL_mixer.pc.in", "@prefix@", HOMEBREW_PREFIX
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --enable-music-ogg
	 --disable-music-ogg-shared
	 --disable-music-mod-shared
	 ]
	 args << "--disable-music-fluidsynth-shared" if build.with? "fluid-synth"
	 args << "--disable-music-flac-shared" if build.with? "flac"
	 args << "--disable-music-mp3-shared" if build.with? "smpeg"
	 system "./configure", *args
	 system "make", "install"
