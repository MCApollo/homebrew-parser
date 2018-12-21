name :
	 UrdfdomHeaders
homepage :
	 https://wiki.ros.org/urdfdom_headers/
url :
	 https://github.com/ros/urdfdom_headers/archive/1.0.2.tar.gz
description :
	 Headers for Unified Robot Description Format (URDF) parsers
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
