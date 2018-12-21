name :
	 Urdfdom
homepage :
	 https://wiki.ros.org/urdf/
url :
	 https://github.com/ros/urdfdom/archive/1.0.0.tar.gz
description :
	 Unified Robot Description Format (URDF) parser
build_deps :
	 cmake
link_deps :
	 console_bridge
	 tinyxml
	 urdfdom_headers
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
