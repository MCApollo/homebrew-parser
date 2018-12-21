name :
	 SdlNet
homepage :
	 https://www.libsdl.org/projects/SDL_net/release-1.2.html
url :
	 https://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.8.tar.gz
description :
	 Sample cross-platform networking library
build_deps :
	 pkg-config
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--disable-sdltest"
	 system "make", "install"
