name :
	 Xtensor
homepage :
	 http://quantstack.net/xtensor
url :
	 https://github.com/QuantStack/xtensor/archive/0.19.0.tar.gz
description :
	 Multi-dimensional arrays with broadcasting and lazy computing
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 ['xtl']
	 ['https://github.com/QuantStack/xtl/archive/0.5.2.tar.gz']
patches :
EOF_patch :
install :
	 resource("xtl").stage do
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 end
	 system "cmake", ".", "-Dxtl_DIR=#{lib}/cmake/xtl", *std_cmake_args
	 system "make", "install"
