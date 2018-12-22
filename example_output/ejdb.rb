name :
	 Ejdb
homepage :
	 http://ejdb.org
url :
	 https://github.com/Softmotions/ejdb/archive/v1.2.12.tar.gz
description :
	 C library based on modified version of Tokyo Cabinet
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
	 end
