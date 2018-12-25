name :
	 Fifechan
homepage :
	 https://fifengine.github.io/fifechan/
url :
	 https://github.com/fifengine/fifechan/archive/0.1.4.tar.gz
description :
	 C++ GUI library designed for games
build_deps :
	 cmake
link_deps :
	 allegro
	 sdl2
	 sdl2_image
	 sdl2_ttf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DENABLE_SDL_CONTRIB=ON", *std_cmake_args
	 system "make", "install"
	 end
