name :
	 Parallelstl
homepage :
	 https://github.com/intel/parallelstl
url :
	 https://github.com/intel/parallelstl/archive/20181204.tar.gz
description :
	 C++ standard library algorithms with support for execution policies
build_deps :
link_deps :
	 tbb
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 include.install Dir["include/*"]
