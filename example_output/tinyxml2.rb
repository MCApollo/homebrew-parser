name :
	 Tinyxml2
homepage :
	 http://grinninglizard.com/tinyxml2
url :
	 https://github.com/leethomason/tinyxml2/archive/7.0.1.tar.gz
description :
	 Improved tinyxml (in memory efficiency and size)
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
