name :
	 DoubleConversion
homepage :
	 https://github.com/google/double-conversion
url :
	 https://github.com/google/double-conversion/archive/v3.1.1.tar.gz
description :
	 Binary-decimal and decimal-binary routines for IEEE doubles
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "dc-build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
