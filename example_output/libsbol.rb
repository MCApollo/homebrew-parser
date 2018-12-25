name :
	 Libsbol
homepage :
	 https://synbiodex.github.io/libSBOL
url :
	 https://github.com/SynBioDex/libSBOL/archive/v2.3.0.0.tar.gz
description :
	 Read and write files in the Synthetic Biology Open Language (SBOL)
build_deps :
	 cmake
	 pkg-config
link_deps :
	 jsoncpp
	 raptor
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DCMAKE_CXX_FLAGS=-I/System/Library/Frameworks/Python.framework/Headers",
	 "-DSBOL_BUILD_SHARED=TRUE",
	 "-DSBOL_BUILD_STATIC=FALSE",
	 *std_cmake_args
	 system "make", "install"
