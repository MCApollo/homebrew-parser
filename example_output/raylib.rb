name :
	 Raylib
homepage :
	 https://www.raylib.com/
url :
	 https://github.com/raysan5/raylib/archive/2.0.0.tar.gz
description :
	 Simple and easy-to-use library to learn videogames programming
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DSTATIC_RAYLIB=ON",
	 "-DSHARED_RAYLIB=ON",
	 "-DMACOS_FATLIB=OFF",
	 "-DBUILD_EXAMPLES=OFF",
	 "-DBUILD_GAMES=OFF",
	 *std_cmake_args
	 system "make", "install"
