name :
	 Sdl2Mixer
homepage :
	 https://www.libsdl.org/projects/SDL_mixer/
url :
	 https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.4.tar.gz
description :
	 Sample multi-channel audio mixer library
build_deps :
	 pkg-config
link_deps :
	 libmodplug
	 libvorbis
	 sdl2
optional_deps :
	 flac
	 fluid-synth
	 libmikmod
	 mpg123
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "SDL2_mixer.pc.in", "@prefix@", HOMEBREW_PREFIX
	 args = %W[
	 --prefix=#{prefix} --disable-dependency-tracking
	 --enable-music-ogg --disable-music-ogg-shared
	 --disable-music-flac-shared
	 --disable-music-midi-fluidsynth-shared
	 --disable-music-mod-mikmod-shared
	 --enable-music-mod-modplug
	 --disable-music-mod-modplug-shared
	 --disable-music-mp3-smpeg
	 --disable-music-mp3-mpg123-shared
	 ]
	 args << "--disable-music-flac" if build.without? "flac"
	 args << "--disable-music-midi-fluidsynth" if build.without? "fluid-synth"
	 args << "--enable-music-mod-mikmod" if build.with? "libmikmod"
	 args << "--disable-music-mp3-mpg123" if build.without? "mpg123"
	 system "./configure", *args
	 system "make", "install"
