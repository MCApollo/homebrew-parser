name :
	 Nanomsg
homepage :
	 https://nanomsg.org/
url :
	 https://github.com/nanomsg/nanomsg/archive/1.1.5.tar.gz
description :
	 Socket library in C
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
	 system "cmake", *std_cmake_args
	 system "make"
	 system "make", "install"
