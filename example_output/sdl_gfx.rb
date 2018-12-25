name :
	 SdlGfx
homepage :
	 https://www.ferzkopp.net/joomla/content/view/19/14/
url :
	 https://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-2.0.26.tar.gz
description :
	 Graphics drawing primitives and other support functions
build_deps :
link_deps :
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-sdltest"
	 system "make", "install"
