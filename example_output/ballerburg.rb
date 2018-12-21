name :
	 Ballerburg
homepage :
	 https://baller.tuxfamily.org/
url :
	 https://download.tuxfamily.org/baller/ballerburg-1.2.0.tar.gz
description :
	 Castle combat game
build_deps :
	 cmake
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
