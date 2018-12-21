name :
	 Libsquish
homepage :
	 https://sourceforge.net/projects/libsquish/
url :
	 https://downloads.sourceforge.net/project/libsquish/libsquish-1.15.tgz
description :
	 Library for compressing images with the DXT standard
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
