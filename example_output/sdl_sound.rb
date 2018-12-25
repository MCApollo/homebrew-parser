name :
	 SdlSound
homepage :
	 https://icculus.org/SDL_sound/
url :
	 https://icculus.org/SDL_sound/downloads/SDL_sound-1.0.3.tar.gz
description :
	 Library to decode several popular sound file formats
build_deps :
	 pkg-config
link_deps :
	 libogg
	 libvorbis
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 inreplace "bootstrap", "/usr/bin/glibtoolize", "#{Formula["libtool"].opt_bin}/glibtoolize"
	 system "./bootstrap"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-sdltest"
	 system "make"
	 system "make", "check"
	 system "make", "install"
