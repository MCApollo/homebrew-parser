name :
	 GribApi
homepage :
	 https://software.ecmwf.int/wiki/display/GRIB/Home
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/g/grib-api/grib-api_1.27.0.orig.tar.xz
description :
	 Encode and decode grib messages (editions 1 and 2)
build_deps :
	 cmake
link_deps :
	 gcc
	 jasper
	 libpng
	 numpy
optional_deps :
conflicts :
	 eccodes
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "src/grib_jasper_encoding.c", "image.inmem_    = 1;", ""
	 inreplace "CMakeLists.txt", "find_package( OpenJPEG )", ""
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args, "-DENABLE_NETCDF=OFF",
	 "-DENABLE_PNG=ON",
	 "-DPNG_PNG_INCLUDE_DIR=#{Formula["libpng"].opt_include}"
	 system "make", "install"
	 end
