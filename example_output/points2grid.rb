name :
	 Points2grid
homepage :
	 https://github.com/CRREL/points2grid
url :
	 https://github.com/CRREL/points2grid/archive/1.3.1.tar.gz
description :
	 Generate digital elevation models using local griding
build_deps :
	 cmake
link_deps :
	 boost
	 gdal
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args + ["-DWITH_GDAL=ON"]
	 libexec.install "test/data/example.las"
	 system "cmake", ".", *args
	 system "make", "install"
