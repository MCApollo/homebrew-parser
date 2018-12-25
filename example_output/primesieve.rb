name :
	 Primesieve
homepage :
	 https://primesieve.org/
url :
	 https://github.com/kimwalisch/primesieve/archive/v7.2.tar.gz
description :
	 Fast C/C++ prime number generator
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
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
