name :
	 Libcerf
homepage :
	 http://apps.jcns.fz-juelich.de/doku/sc/libcerf
url :
	 http://apps.jcns.fz-juelich.de/src/libcerf/libcerf-1.9.tgz
description :
	 Numeric library for complex error functions
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 mv prefix/"man", share
