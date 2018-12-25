name :
	 SdlTtf
homepage :
	 https://www.libsdl.org/projects/SDL_ttf/
url :
	 https://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-2.0.11.tar.gz
description :
	 Library for using TrueType fonts in SDL applications
build_deps :
	 pkg-config
link_deps :
	 freetype
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gist.githubusercontent.com/tomyun/a8d2193b6e18218217c4/raw/8292c48e751c6a9939db89553d01445d801420dd/sdl_ttf-fix-1433.diff
EOF_patch :
install :
	 inreplace "SDL_ttf.pc.in", "@prefix@", HOMEBREW_PREFIX
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-sdltest"
	 system "make", "install"
