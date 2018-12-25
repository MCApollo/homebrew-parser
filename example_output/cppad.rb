name :
	 Cppad
homepage :
	 https://www.coin-or.org/CppAD
url :
	 https://github.com/coin-or/CppAD/archive/20180000.0.tar.gz
description :
	 Differentiation of C++ Algorithms
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
	 system "cmake", "..", *std_cmake_args,
	 "-Dcppad_prefix=#{prefix}"
	 system "make", "install"
	 end
	 pkgshare.install "example"
