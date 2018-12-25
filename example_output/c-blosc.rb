name :
	 CBlosc
homepage :
	 http://blosc.org/
url :
	 https://github.com/Blosc/c-blosc/archive/v1.15.0.tar.gz
description :
	 Blocking, shuffling and loss-less compression library
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
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
