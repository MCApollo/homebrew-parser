name :
	 Hyperscan
homepage :
	 https://www.hyperscan.io/
url :
	 https://github.com/intel/hyperscan/archive/v5.0.0.tar.gz
description :
	 High-performance regular expression matching library
build_deps :
	 boost
	 cmake
	 pkg-config
	 ragel
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args, "-DBUILD_STATIC_AND_SHARED=on"
	 system "make", "install"
	 end
