name :
	 EasyrpgPlayer
homepage :
	 https://easyrpg.org/
url :
	 https://easyrpg.org/downloads/player/easyrpg-player-0.5.3.tar.gz
description :
	 RPG Maker 2000/2003 games interpreter
build_deps :
	 pkg-config
link_deps :
	 freetype
	 harfbuzz
	 liblcf
	 libpng
	 libsndfile
	 libvorbis
	 libxmp
	 mpg123
	 pixman
	 sdl2
	 sdl2_mixer
	 speexdsp
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
