name :
	 Taskd
homepage :
	 https://taskwarrior.org/docs/taskserver/setup.html
url :
	 https://taskwarrior.org/download/taskd-1.1.0.tar.gz
description :
	 Client-server synchronization for todo lists
build_deps :
	 cmake
link_deps :
	 gnutls
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
