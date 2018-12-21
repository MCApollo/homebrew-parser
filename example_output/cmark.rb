name :
	 Cmark
homepage :
	 https://commonmark.org/
url :
	 https://github.com/commonmark/cmark/archive/0.28.3.tar.gz
description :
	 Strongly specified, highly compatible implementation of Markdown
build_deps :
	 cmake
	 python
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DCMAKE_INSTALL_LIBDIR=lib", *std_cmake_args
	 system "make"
	 system "make", "test"
	 system "make", "install"
