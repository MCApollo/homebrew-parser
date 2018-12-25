name :
	 Sdl2Ttf
homepage :
	 https://www.libsdl.org/projects/SDL_ttf/
url :
	 https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.14.tar.gz
description :
	 Library for using TrueType fonts in SDL applications
build_deps :
	 pkg-config
link_deps :
	 freetype
	 sdl2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "SDL2_ttf.pc.in", "@prefix@", HOMEBREW_PREFIX
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
