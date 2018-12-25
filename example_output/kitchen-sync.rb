name :
	 KitchenSync
homepage :
	 https://github.com/willbryant/kitchen_sync
url :
	 https://github.com/willbryant/kitchen_sync/archive/1.5.tar.gz
description :
	 Fast efficiently sync database without dumping & reloading
build_deps :
	 cmake
	 pkg-config
link_deps :
	 boost
	 yaml-cpp
	 mysql-client
optional_deps :
	 postgresql
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
