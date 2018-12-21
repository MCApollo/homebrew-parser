name :
	 Armadillo
homepage :
	 https://arma.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/arma/armadillo-9.100.5.tar.xz
description :
	 C++ linear algebra library
build_deps :
	 cmake
	 pkg-config
link_deps :
	 arpack
	 hdf5
	 superlu
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DDETECT_HDF5=ON", *std_cmake_args
	 system "make", "install"
