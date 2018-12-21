name :
	 Pybind11
homepage :
	 https://github.com/pybind/pybind11
url :
	 https://github.com/pybind/pybind11/archive/v2.2.4.tar.gz
description :
	 Seamless operability between C++11 and Python
build_deps :
	 cmake
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DPYBIND11_TEST=OFF", *std_cmake_args
	 system "make", "install"
