name :
	 SuiteSparse
homepage :
	 http://faculty.cse.tamu.edu/davis/suitesparse.html
url :
	 http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-5.3.0.tar.gz
description :
	 Suite of Sparse Matrix Software
build_deps :
	 cmake
link_deps :
	 metis
conflicts :
	 mongoose
patches :
EOF_patch :
install :
	 mkdir "GraphBLAS/build" do
	 system "cmake", "..", *std_cmake_args
