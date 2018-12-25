name :
	 Ompl
homepage :
	 https://ompl.kavrakilab.org/
url :
	 https://bitbucket.org/ompl/ompl/downloads/ompl-1.4.1-Source.tar.gz
description :
	 Open Motion Planning Library consists of many motion planning algorithms
build_deps :
	 cmake
link_deps :
	 boost
	 eigen
optional_deps :
	 ode
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
