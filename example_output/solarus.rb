name :
	 Solarus
homepage :
	 http://www.solarus-games.org/
url :
description :
	 Action-RPG game engine
build_deps :
	 cmake
link_deps :
	 libmodplug
	 libogg
	 libvorbis
	 luajit
	 physfs
	 sdl2
	 sdl2_image
	 sdl2_ttf
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DSOLARUS_GUI=OFF", *std_cmake_args
	 system "make", "install"
