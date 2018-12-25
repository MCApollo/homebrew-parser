name :
	 Sdl2Gfx
homepage :
	 https://www.ferzkopp.net/wordpress/2016/01/02/sdl_gfx-sdl2_gfx/
url :
	 https://www.ferzkopp.net/Software/SDL2_gfx/SDL2_gfx-1.0.4.tar.gz
description :
	 SDL2 graphics drawing primitives and other support functions
build_deps :
link_deps :
	 sdl2
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
