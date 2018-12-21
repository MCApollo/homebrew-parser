name :
	 Teem
homepage :
	 https://teem.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/teem/teem/1.11.0/teem-1.11.0-src.tar.gz
description :
	 Libraries for scientific raster data
build_deps :
	 cmake
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", *std_cmake_args,
	 "-DBUILD_SHARED_LIBS:BOOL=ON",
	 "-DTeem_USE_LIB_INSTALL_SUBDIR:BOOL=ON"
	 system "make", "install"
	 lib.install_symlink Dir.glob(lib/"Teem-#{version}/*.dylib")
	 (lib/"cmake/teem").install_symlink Dir.glob(lib/"Teem-#{version}/*.cmake")
