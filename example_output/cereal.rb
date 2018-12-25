name :
	 Cereal
homepage :
	 https://uscilab.github.io/cereal/
url :
	 https://github.com/USCiLab/cereal/archive/v1.2.2.tar.gz
description :
	 C++11 library for serialization
build_deps :
	 cmake
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DJUST_INSTALL_CEREAL=ON", *std_cmake_args
	 system "make", "install"
