name :
	 AutopanoSiftC
homepage :
	 https://wiki.panotools.org/Autopano-sift-C
url :
	 https://downloads.sourceforge.net/project/hugin/autopano-sift-C/autopano-sift-C-2.5.1/autopano-sift-C-2.5.1.tar.gz
description :
	 Find control points in overlapping image pairs
build_deps :
	 cmake
link_deps :
	 libpano
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
