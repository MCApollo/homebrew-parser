name :
	 Woff2
homepage :
	 https://github.com/google/woff2
url :
	 https://github.com/google/woff2/archive/v1.0.2.tar.gz
description :
	 Utilities to create and convert Web Open Font File (WOFF) files
build_deps :
	 cmake
link_deps :
	 brotli
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 -DCMAKE_INSTALL_NAME_DIR=#{opt_lib}
	 -DCMAKE_BUILD_WITH_INSTALL_NAME_DIR=ON
	 ]
	 system "cmake", ".", *args
	 system "make", "install"
	 bin.install "woff2_info", "woff2_decompress", "woff2_compress"
