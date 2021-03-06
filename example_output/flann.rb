name :
	 Flann
homepage :
	 https://www.cs.ubc.ca/research/flann/
url :
	 https://github.com/mariusmuja/flann/archive/1.9.1.tar.gz
description :
	 Fast Library for Approximate Nearest Neighbors
build_deps :
	 cmake
link_deps :
	 hdf5
	 numpy
optional_deps :
	 python@2
conflicts :
resource :
	 ['dataset.dat', 'testset.dat', 'dataset.hdf5']
	 ['https://www.cs.ubc.ca/research/flann/uploads/FLANN/datasets/dataset.dat', 'https://www.cs.ubc.ca/research/flann/uploads/FLANN/datasets/testset.dat', 'https://www.cs.ubc.ca/research/flann/uploads/FLANN/datasets/dataset.hdf5']
patches :
EOF_patch :
install :
	 if build.with? "python@2"
	 pyarg = "-DBUILD_PYTHON_BINDINGS:BOOL=ON"
	 else
	 pyarg = "-DBUILD_PYTHON_BINDINGS:BOOL=OFF"
	 end
	 system "cmake", ".", *std_cmake_args, pyarg
	 system "make", "install"
