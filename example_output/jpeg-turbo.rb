name :
	 JpegTurbo
homepage :
	 https://www.libjpeg-turbo.org/
url :
	 https://downloads.sourceforge.net/project/libjpeg-turbo/2.0.0/libjpeg-turbo-2.0.0.tar.gz
description :
	 JPEG image codec that aids compression and decompression
build_deps :
	 cmake
	 nasm
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DWITH_JPEG8=1", *std_cmake_args
	 system "make"
	 system "make", "test"
	 system "make", "install"
