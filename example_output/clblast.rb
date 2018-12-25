name :
	 Clblast
homepage :
	 https://github.com/CNugteren/CLBlast
url :
	 https://github.com/CNugteren/CLBlast/archive/1.5.0.tar.gz
description :
	 Tuned OpenCL BLAS library
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
	 pkgshare.install "samples"
