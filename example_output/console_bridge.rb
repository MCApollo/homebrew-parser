name :
	 ConsoleBridge
homepage :
	 https://wiki.ros.org/console_bridge/
url :
	 https://github.com/ros/console_bridge/archive/0.4.2.tar.gz
description :
	 Robot Operating System-independent package for logging
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
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
