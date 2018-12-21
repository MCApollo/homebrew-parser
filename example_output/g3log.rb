name :
	 G3log
homepage :
	 https://github.com/KjellKod/g3log
url :
	 https://github.com/KjellKod/g3log/archive/1.3.2.tar.gz
description :
	 Asynchronous, 'crash safe', logger that is easy to use
build_deps :
	 cmake
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
