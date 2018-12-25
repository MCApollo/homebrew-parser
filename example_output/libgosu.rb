name :
	 Libgosu
homepage :
	 https://libgosu.org
url :
	 https://github.com/gosu/gosu/archive/v0.14.4.tar.gz
description :
	 2D game development library
build_deps :
	 cmake
	 pkg-config
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
	 mkdir "build" do
	 system "cmake", "../cmake", *std_cmake_args
	 system "make", "install"
	 end
