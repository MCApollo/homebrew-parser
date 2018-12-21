name :
	 Chromaprint
homepage :
	 https://acoustid.org/chromaprint
url :
	 https://github.com/acoustid/chromaprint/releases/download/v1.4.3/chromaprint-1.4.3.tar.gz
description :
	 Core component of the AcoustID project (Audio fingerprinting)
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
