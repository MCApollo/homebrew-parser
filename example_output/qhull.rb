name :
	 Qhull
homepage :
	 http://www.qhull.org/
url :
	 http://www.qhull.org/download/qhull-2015-src-7.2.0.tgz
description :
	 Computes convex hulls in n dimensions
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
