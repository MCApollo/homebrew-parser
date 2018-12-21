name :
	 Sdl2Net
homepage :
	 https://www.libsdl.org/projects/SDL_net/
url :
	 https://www.libsdl.org/projects/SDL_net/release/SDL2_net-2.0.1.tar.gz
description :
	 Small sample cross-platform networking library
build_deps :
	 pkg-config
link_deps :
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 inreplace "SDL2_net.pc.in", "@prefix@", HOMEBREW_PREFIX
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--disable-sdltest"
	 system "make", "install"
