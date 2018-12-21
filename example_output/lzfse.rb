name :
	 Lzfse
homepage :
	 https://github.com/lzfse/lzfse
url :
	 https://github.com/lzfse/lzfse/archive/lzfse-1.0.tar.gz
description :
	 Apple LZFSE compression library and command-line tool
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
