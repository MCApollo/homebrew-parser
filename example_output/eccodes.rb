name :
	 Eccodes
homepage :
	 https://software.ecmwf.int/wiki/display/ECC/ecCodes+Home
url :
	 https://software.ecmwf.int/wiki/download/attachments/45757960/eccodes-2.8.2-Source.tar.gz
description :
	 Decode and encode messages in the GRIB 1/2 and  BUFR 3/4 formats
build_deps :
	 cmake
link_deps :
	 gcc
	 jasper
	 libpng
	 numpy
conflicts :
	 grib-api
patches :
EOF_patch :
install :
	 inreplace "CMakeLists.txt", "find_package( OpenJPEG )", ""
	 mkdir "build" do
	 system "cmake", "..", "-DENABLE_NETCDF=OFF", "-DENABLE_PNG=ON", *std_cmake_args
	 system "make", "install"
