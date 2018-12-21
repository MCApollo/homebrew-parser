name :
	 Liblas
homepage :
	 https://liblas.org/
url :
	 https://download.osgeo.org/liblas/libLAS-1.8.1.tar.bz2
description :
	 C/C++ library for reading and writing the LAS LiDAR format
build_deps :
	 cmake
link_deps :
	 boost
	 gdal
	 libgeotiff
conflicts :
patches :
	 https://github.com/libLAS/libLAS/commit/49606470.patch?full_index=1
	 https://github.com/libLAS/libLAS/commit/ec10e274.diff?full_index=1
EOF_patch :
install :
	 ENV.cxx11
	 mkdir "macbuild" do
	 ENV["Boost_INCLUDE_DIR"] = "#{HOMEBREW_PREFIX}/include"
	 ENV["Boost_LIBRARY_DIRS"] = "#{HOMEBREW_PREFIX}/lib"
	 system "cmake", "..", *std_cmake_args,
	 "-DWITH_GDAL=ON",
	 "-DWITH_GEOTIFF=ON"
	 system "make"
	 system "make", "test" if build.bottle?
	 system "make", "install"
