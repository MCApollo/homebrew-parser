name :
	 Assimp
homepage :
	 http://www.assimp.org
url :
	 https://github.com/assimp/assimp/archive/v4.1.0.tar.gz
description :
	 Portable library for importing many well-known 3D model formats
build_deps :
	 boost
	 cmake
link_deps :
conflicts :
patches :
	 https://github.com/assimp/assimp/pull/1634.patch?full_index=1
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DASSIMP_BUILD_TESTS=OFF"
	 system "cmake", *args
	 system "make", "install"
