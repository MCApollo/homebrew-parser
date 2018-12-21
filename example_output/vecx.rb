name :
	 Vecx
homepage :
	 https://github.com/jhawthorn/vecx
url :
	 https://github.com/jhawthorn/vecx/archive/v1.1.tar.gz
description :
	 Vectrex emulator
build_deps :
link_deps :
	 sdl
	 sdl_gfx
	 sdl_image
conflicts :
patches :
EOF_patch :
install :
	 inreplace ["e6809.c", "vecx.c"], /__inline/, 'static \1'
	 system "make"
	 bin.install "vecx"
