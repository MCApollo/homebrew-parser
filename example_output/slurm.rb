name :
	 Slurm
homepage :
	 https://github.com/mattthias/slurm
url :
	 https://github.com/mattthias/slurm/archive/upstream/0.4.3.tar.gz
description :
	 Yet another network load monitor
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
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
