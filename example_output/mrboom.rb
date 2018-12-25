name :
	 Mrboom
homepage :
	 http://mrboom.mumblecore.org/
url :
	 https://github.com/Javanaise/mrboom-libretro/archive/4.5.tar.gz
description :
	 Eight player Bomberman clone
build_deps :
	 cmake
link_deps :
	 libmodplug
	 minizip
	 sdl2
	 sdl2_mixer
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "mrboom", "LIBSDL2=1"
	 system "make", "install", "PREFIX=#{prefix}"
