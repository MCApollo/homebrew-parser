name :
	 Rawtoaces
homepage :
	 https://github.com/ampas/rawtoaces
url :
	 https://github.com/ampas/rawtoaces/archive/v1.0.tar.gz
description :
	 RAW to ACES Utility
build_deps :
	 cmake
link_deps :
	 aces_container
	 boost
	 ceres-solver
	 ilmbase
	 libraw
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
