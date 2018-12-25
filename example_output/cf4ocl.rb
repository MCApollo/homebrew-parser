name :
	 Cf4ocl
homepage :
	 https://fakenmc.github.io/cf4ocl/
url :
	 https://github.com/fakenmc/cf4ocl/archive/v2.1.0.tar.gz
description :
	 C Framework for OpenCL
build_deps :
	 cmake
	 pkg-config
link_deps :
	 glib
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
