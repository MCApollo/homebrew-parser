name :
	 Uchardet
homepage :
	 https://www.freedesktop.org/wiki/Software/uchardet/
url :
	 https://www.freedesktop.org/software/uchardet/releases/uchardet-0.0.6.tar.xz
description :
	 Encoding detector library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DCMAKE_INSTALL_NAME_DIR=#{lib}"
	 system "cmake", ".", *args
	 system "make", "install"
