name :
	 KnownHosts
homepage :
	 https://github.com/markmcconachie/known_hosts
url :
	 https://github.com/markmcconachie/known_hosts/archive/1.0.0.tar.gz
description :
	 Command-line manager for known hosts
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
	 system "make"
	 system "make", "install"
