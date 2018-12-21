name :
	 Libsoxr
homepage :
	 https://sourceforge.net/projects/soxr/
url :
	 https://downloads.sourceforge.net/project/soxr/soxr-0.1.3-Source.tar.xz
description :
	 High quality, one-dimensional sample-rate conversion library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
