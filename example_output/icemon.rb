name :
	 Icemon
homepage :
	 https://github.com/icecc/icemon
url :
	 https://github.com/icecc/icemon/archive/v3.2.0.tar.gz
description :
	 Icecream GUI Monitor
build_deps :
	 cmake
	 pkg-config
link_deps :
	 icecream
	 lzo
	 qt
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
