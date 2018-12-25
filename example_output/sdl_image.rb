name :
	 SdlImage
homepage :
	 https://www.libsdl.org/projects/SDL_image
url :
	 https://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.12.tar.gz
description :
	 Image file loading library
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 libpng
	 libtiff
	 sdl
	 webp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/41996822/sdl_image/IMG_ImageIO.m.patch
EOF_patch :
install :
	 inreplace "SDL_image.pc.in", "@prefix@", HOMEBREW_PREFIX
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-imageio",
	 "--disable-jpg-shared",
	 "--disable-png-shared",
	 "--disable-sdltest",
	 "--disable-tif-shared",
	 "--disable-webp-shared"
	 system "make", "install"
