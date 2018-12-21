name :
	 Cpputest
homepage :
	 https://www.cpputest.org/
url :
	 https://github.com/cpputest/cpputest/releases/download/v3.8/cpputest-3.8.tar.gz
description :
	 C /C++ based unit xUnit test framework
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
