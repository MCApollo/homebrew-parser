name :
	 Viennacl
homepage :
	 https://viennacl.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/viennacl/1.7.x/ViennaCL-1.7.1.tar.gz
description :
	 Linear algebra library for many-core architectures and multi-core CPUs
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
	 libexec.install "#{buildpath}/examples/benchmarks/dense_blas-bench-cpu" => "test"
