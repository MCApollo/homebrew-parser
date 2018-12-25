name :
	 Librsync
homepage :
	 https://librsync.github.io/
url :
	 https://github.com/librsync/librsync/archive/v2.0.2.tar.gz
description :
	 Library that implements the rsync remote-delta algorithm
build_deps :
	 cmake
link_deps :
	 popt
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
	 man1.install "doc/rdiff.1"
	 man3.install "doc/librsync.3"
