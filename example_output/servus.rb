name :
	 Servus
homepage :
	 https://github.com/HBPVIS/Servus
url :
	 https://github.com/HBPVIS/Servus.git
description :
	 Library and Utilities for zeroconf networking
build_deps :
	 cmake
link_deps :
	 boost
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
