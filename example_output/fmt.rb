name :
	 Fmt
homepage :
	 https://fmtlib.github.io/
url :
	 https://github.com/fmtlib/fmt/archive/5.2.1.tar.gz
description :
	 Open-source formatting library for C++
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
