name :
	 Freedink
homepage :
	 https://www.gnu.org/software/freedink/
url :
	 https://ftp.gnu.org/gnu/freedink/freedink-108.4.tar.gz
description :
	 Portable version of the Dink Smallwood game engine
build_deps :
	 pkg-config
link_deps :
	 check
	 fontconfig
	 gettext
	 libzip
	 sdl2_image
	 sdl_gfx
	 sdl_image
	 sdl_mixer
	 sdl_ttf
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 resource("freedink-data").stage do
	 inreplace "Makefile", "xargs -0r", "xargs -0"
	 system "make", "install", "PREFIX=#{prefix}"
