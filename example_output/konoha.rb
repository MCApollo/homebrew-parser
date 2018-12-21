name :
	 Konoha
homepage :
	 https://github.com/konoha-project/konoha3
url :
	 https://github.com/konoha-project/konoha3/archive/v0.1.tar.gz
description :
	 Static scripting language with extensible syntax
build_deps :
	 cmake
link_deps :
	 json-c
	 mecab
	 open-mpi
	 pcre
	 python
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "install"
