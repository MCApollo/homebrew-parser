name :
	 Libforensic1394
homepage :
	 https://freddie.witherden.org/tools/libforensic1394/
url :
	 https://freddie.witherden.org/tools/libforensic1394/releases/libforensic1394-0.2.tar.gz
description :
	 ) interface
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
