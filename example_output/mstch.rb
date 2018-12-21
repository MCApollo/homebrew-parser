name :
	 Mstch
homepage :
	 https://github.com/no1msd/mstch
url :
	 https://github.com/no1msd/mstch/archive/1.0.2.tar.gz
description :
	 Complete implementation of {{mustache}} templates using modern C++
build_deps :
	 cmake
link_deps :
	 boost
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 (lib/"pkgconfig/mstch.pc").write pc_file
