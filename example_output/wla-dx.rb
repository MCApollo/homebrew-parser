name :
	 WlaDx
homepage :
	 https://github.com/vhelin/wla-dx
url :
	 https://github.com/vhelin/wla-dx/archive/v9.7.tar.gz
description :
	 Yet another crossassembler package
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
