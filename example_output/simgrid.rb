name :
	 Simgrid
homepage :
	 http://simgrid.gforge.inria.fr
url :
	 https://gforge.inria.fr/frs/download.php/file/37602/SimGrid-3.20.tar.gz
description :
	 Studies behavior of large-scale distributed systems
build_deps :
	 cmake
	 doxygen
link_deps :
	 boost
	 graphviz
	 pcre
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".",
	 "-Denable_debug=on",
	 "-Denable_compile_optimizations=off",
	 *std_cmake_args
	 system "make", "install"
