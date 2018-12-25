name :
	 Oclgrind
homepage :
	 https://github.com/jrprice/Oclgrind
url :
	 https://github.com/jrprice/Oclgrind/archive/v18.3.tar.gz
description :
	 OpenCL device simulator and debugger
build_deps :
	 cmake
	 llvm
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
