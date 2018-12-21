name :
	 Tgui
homepage :
	 https://tgui.eu
url :
	 https://github.com/texus/TGUI/archive/v0.8.1.tar.gz
description :
	 GUI library for use with sfml
build_deps :
	 cmake
link_deps :
	 sfml
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args,
	 "-DTGUI_MISC_INSTALL_PREFIX=#{pkgshare}"
	 system "make", "install"
