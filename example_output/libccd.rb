name :
	 Libccd
homepage :
	 http://libccd.danfis.cz/
url :
	 https://github.com/danfis/libccd/archive/v2.0.tar.gz
description :
	 Collision detection between two convex shapes
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DCCD_DOUBLE=ON", *std_cmake_args
	 system "make", "install"
