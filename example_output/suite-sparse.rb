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
optional_deps :
conflicts :
	 mongoose
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "GraphBLAS/build" do
	 system "cmake", "..", *std_cmake_args
	 end
	 args = [
	 "INSTALL=#{prefix}",
	 "BLAS=-framework Accelerate",
	 "LAPACK=$(BLAS)",
	 "MY_METIS_LIB=-L#{Formula["metis"].opt_lib} -lmetis",
	 "MY_METIS_INC=#{Formula["metis"].opt_include}",
	 ]
	 system "make", "library", *args
	 system "make", "install", *args
	 lib.install Dir["**/*.a"]
	 pkgshare.install "KLU/Demo/klu_simple.c"
