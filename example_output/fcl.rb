name :
	 Fcl
homepage :
	 https://flexible-collision-library.github.io/
url :
	 https://github.com/flexible-collision-library/fcl/archive/0.5.0.tar.gz
description :
	 Flexible Collision Library
build_deps :
	 cmake
	 pkg-config
link_deps :
	 boost
	 libccd
	 octomap
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
