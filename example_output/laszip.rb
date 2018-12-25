name :
	 Laszip
homepage :
	 https://laszip.org/
url :
	 https://github.com/LASzip/LASzip/releases/download/3.2.8/laszip-src-3.2.8.tar.gz
description :
	 Lossless LiDAR compression
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 pkgshare.install "example"
