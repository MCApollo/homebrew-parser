name :
	 Jthread
homepage :
	 https://research.edm.uhasselt.be/jori/jthread
url :
	 https://research.edm.uhasselt.be/jori/jthread/jthread-1.3.3.tar.bz2
description :
	 C++ class to make use of threads easy
build_deps :
	 cmake
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
