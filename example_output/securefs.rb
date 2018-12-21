name :
	 Securefs
homepage :
	 https://github.com/netheril96/securefs
url :
	 https://github.com/netheril96/securefs/archive/0.8.2.tar.gz
description :
	 Filesystem with transparent authenticated encryption
build_deps :
	 cmake
link_deps :
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
