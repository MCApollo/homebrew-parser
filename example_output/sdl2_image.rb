name :
	 Sdl2Image
homepage :
	 https://www.libsdl.org/projects/SDL_image/
url :
	 https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.4.tar.gz
description :
	 Library for loading images as SDL surfaces and textures
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 libpng
	 libtiff
	 sdl2
	 webp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "SDL2_image.pc.in", "@prefix@", HOMEBREW_PREFIX
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-imageio",
	 "--disable-jpg-shared",
	 "--disable-png-shared",
	 "--disable-tif-shared",
	 "--disable-webp-shared"
	 system "make", "install"
