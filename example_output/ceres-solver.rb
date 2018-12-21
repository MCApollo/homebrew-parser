name :
	 CeresSolver
homepage :
	 http://ceres-solver.org/
url :
	 http://ceres-solver.org/ceres-solver-1.14.0.tar.gz
description :
	 C++ library for large-scale optimization
build_deps :
link_deps :
	 cmake
	 eigen
	 gflags
	 glog
	 metis
	 suite-sparse
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args,
	 "-DBUILD_SHARED_LIBS=ON",
	 "-DEIGEN_INCLUDE_DIR=#{Formula["eigen"].opt_include}/eigen3",
	 "-DMETIS_LIBRARY=#{Formula["metis"].opt_lib}/libmetis.dylib",
	 "-DGLOG_INCLUDE_DIR_HINTS=#{Formula["glog"].opt_include}",
	 "-DGLOG_LIBRARY_DIR_HINTS=#{Formula["glog"].opt_lib}",
	 "-DTBB=OFF"
	 system "make"
	 system "make", "install"
	 pkgshare.install "examples", "data"
	 doc.install "docs/html" unless build.head?
