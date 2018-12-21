name :
	 Csfml
homepage :
	 https://www.sfml-dev.org/
url :
	 https://github.com/SFML/CSFML/archive/2.4.tar.gz
description :
	 SMFL bindings for C
build_deps :
	 cmake
link_deps :
	 sfml
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DCMAKE_MODULE_PATH=#{Formula["sfml"].share}/SFML/cmake/Modules/", *std_cmake_args
	 system "make", "install"
