name :
	 Libvidstab
homepage :
	 http://public.hronopik.de/vid.stab/
url :
	 https://github.com/georgmartius/vid.stab/archive/v1.1.0.tar.gz
description :
	 Transcode video stabilization plugin
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
	 system "cmake", ".", "-DUSE_OMP=OFF", *std_cmake_args
	 system "make", "install"
