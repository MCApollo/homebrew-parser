name :
	 Ctl
homepage :
	 https://github.com/ampas/CTL
url :
	 https://github.com/ampas/CTL/archive/ctl-1.5.2.tar.gz
description :
	 Programming language for digital color management
build_deps :
	 cmake
link_deps :
	 aces_container
	 ilmbase
	 libtiff
	 openexr
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.delete "CTL_MODULE_PATH"
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
