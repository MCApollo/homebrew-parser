name :
	 Lasi
homepage :
	 https://www.unifont.org/lasi/
url :
	 https://downloads.sourceforge.net/project/lasi/lasi/1.1.2%20Source/libLASi-1.1.2.tar.gz
description :
	 C++ stream output interface for creating Postscript documents
build_deps :
	 cmake
	 doxygen
	 pkg-config
link_deps :
	 pango
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args - %w[-DCMAKE_BUILD_TYPE=None]
	 system "cmake", ".", "-DCMAKE_BUILD_TYPE=Release", *args
	 system "make", "install"
