name :
	 Pdal
homepage :
	 https://www.pdal.io/
url :
	 https://github.com/PDAL/PDAL/archive/1.8.0.tar.gz
description :
	 Point data abstraction library
build_deps :
	 cmake
	 pkg-config
link_deps :
	 gdal
	 hdf5
	 laszip
	 numpy
	 pcl
	 postgresql
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args,
	 "-DWITH_LASZIP=TRUE",
	 "-DBUILD_PLUGIN_GREYHOUND=ON",
	 "-DBUILD_PLUGIN_ICEBRIDGE=ON",
	 "-DBUILD_PLUGIN_PCL=ON",
	 "-DBUILD_PLUGIN_PGPOINTCLOUD=ON",
	 "-DBUILD_PLUGIN_PYTHON=ON",
	 "-DBUILD_PLUGIN_SQLITE=ON"
	 system "make", "install"
	 doc.install "examples", "test"
