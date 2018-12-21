name :
	 AcesContainer
homepage :
	 https://github.com/ampas/aces_container
url :
	 https://github.com/ampas/aces_container/archive/v1.0.2.tar.gz
description :
	 Reference implementation of SMPTE ST2065-4
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
