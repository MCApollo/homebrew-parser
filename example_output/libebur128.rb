name :
	 Libebur128
homepage :
	 https://github.com/jiixyj/libebur128
url :
	 https://github.com/jiixyj/libebur128/archive/v1.2.4.tar.gz
description :
	 Library implementing the EBU R128 loudness standard
build_deps :
	 cmake
	 pkg-config
link_deps :
	 speex
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
