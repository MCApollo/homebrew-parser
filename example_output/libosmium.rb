name :
	 Libosmium
homepage :
	 https://osmcode.org/libosmium/
url :
	 https://github.com/osmcode/libosmium/archive/v2.15.0.tar.gz
description :
	 Fast and flexible C++ library for working with OpenStreetMap data
build_deps :
	 boost
	 cmake
link_deps :
optional_deps :
	 doxygen
	 expat
	 gdal
	 google-sparsehash
	 proj
conflicts :
resource :
	 ['protozero']
	 ['https://github.com/mapbox/protozero/archive/v1.6.3.tar.gz']
patches :
EOF_patch :
install :
	 resource("protozero").stage { libexec.install "include" }
	 system "cmake", ".", "-DINSTALL_GDALCPP=ON",
	 "-DINSTALL_UTFCPP=ON",
	 "-DPROTOZERO_INCLUDE_DIR=#{libexec}/include",
	 *std_cmake_args
	 system "make", "install"
