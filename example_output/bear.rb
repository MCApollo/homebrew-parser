name :
	 Bear
homepage :
	 https://github.com/rizsotto/Bear
url :
	 https://github.com/rizsotto/Bear/archive/2.3.13.tar.gz
description :
	 Generate compilation database for clang tooling
build_deps :
	 cmake
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
