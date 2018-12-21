name :
	 Innoextract
homepage :
	 https://constexpr.org/innoextract/
url :
	 https://constexpr.org/innoextract/files/innoextract-1.7.tar.gz
description :
	 Tool to unpack installers created by Inno Setup
build_deps :
	 cmake
link_deps :
	 boost
	 xz
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
