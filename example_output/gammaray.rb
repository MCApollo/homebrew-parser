name :
	 Gammaray
homepage :
	 https://www.kdab.com/kdab-products/gammaray/
url :
	 https://github.com/KDAB/GammaRay/releases/download/v2.9.1/gammaray-2.9.1.tar.gz
description :
	 Examine and manipulate Qt application internals at runtime
build_deps :
	 cmake
link_deps :
	 graphviz
	 qt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.libcxx
	 system "cmake", *std_cmake_args,
	 "-DCMAKE_DISABLE_FIND_PACKAGE_Graphviz=ON",
	 "-DCMAKE_DISABLE_FIND_PACKAGE_VTK=OFF"
	 system "make", "install"
