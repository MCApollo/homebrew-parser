name :
	 Libtins
homepage :
	 https://libtins.github.io/
url :
	 https://github.com/mfontanini/libtins/archive/v4.1.tar.gz
description :
	 C++ network packet sniffing and crafting library
build_deps :
	 cmake
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 doc.install "examples"
