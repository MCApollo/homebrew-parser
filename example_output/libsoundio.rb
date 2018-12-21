name :
	 Libsoundio
homepage :
	 http://libsound.io
url :
	 https://github.com/andrewrk/libsoundio/archive/1.1.0.tar.gz
description :
	 Cross-platform audio input and output
build_deps :
	 cmake
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
