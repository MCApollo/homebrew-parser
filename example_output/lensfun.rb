name :
	 Lensfun
homepage :
	 https://lensfun.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/lensfun/0.3.95/lensfun-0.3.95.tar.gz
description :
	 Remove defects from digital images
build_deps :
	 cmake
	 pkg-config
link_deps :
	 gettext
	 glib
	 libpng
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
