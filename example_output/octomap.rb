name :
	 Octomap
homepage :
	 https://octomap.github.io/
url :
	 https://github.com/OctoMap/octomap/archive/v1.9.0.tar.gz
description :
	 Efficient probabilistic 3D mapping framework based on octrees
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
	 cd "octomap" do
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 end
