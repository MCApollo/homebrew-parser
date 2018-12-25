name :
	 Cminpack
homepage :
	 http://devernay.free.fr/hacks/cminpack/cminpack.html
url :
	 https://github.com/devernay/cminpack/archive/v1.3.6.tar.gz
description :
	 Solves nonlinear equations and nonlinear least squares problems
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
	 system "cmake", ".", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
	 system "make", "install"
	 man3.install Dir["doc/*.3"]
	 doc.install Dir["doc/*"]
	 pkgshare.install "examples"
