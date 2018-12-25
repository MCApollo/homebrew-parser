name :
	 Opencc
homepage :
	 https://github.com/BYVoid/OpenCC
url :
	 https://dl.bintray.com/byvoid/opencc/opencc-1.0.4.tar.gz
description :
	 Simplified-traditional Chinese conversion tool
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
	 system "cmake", ".", "-DBUILD_DOCUMENTATION:BOOL=OFF", *std_cmake_args
	 system "make"
	 system "make", "install"
