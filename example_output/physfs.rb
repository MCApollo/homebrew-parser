name :
	 Physfs
homepage :
	 https://icculus.org/physfs/
url :
	 https://icculus.org/physfs/downloads/physfs-3.0.1.tar.bz2
description :
	 Library to provide abstract access to various archives
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "macbuild" do
	 args = std_cmake_args
	 args << "-DPHYSFS_BUILD_TEST=TRUE"
	 args << "-DPHYSFS_BUILD_WX_TEST=FALSE" unless build.head?
	 system "cmake", "..", *args
	 system "make", "install"
