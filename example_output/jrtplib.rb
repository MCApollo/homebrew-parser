name :
	 Jrtplib
homepage :
	 https://research.edm.uhasselt.be/jori/jrtplib
url :
	 https://research.edm.uhasselt.be/jori/jrtplib/jrtplib-3.11.1.tar.bz2
description :
	 Fully featured C++ Library for RTP (Real-time Transport Protocol)
build_deps :
	 cmake
	 pkg-config
link_deps :
	 jthread
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
