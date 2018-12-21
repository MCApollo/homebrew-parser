name :
	 CmarkGfm
homepage :
	 https://github.com/github/cmark-gfm
url :
	 https://github.com/github/cmark-gfm/archive/0.28.3.gfm.19.tar.gz
description :
	 C implementation of GitHub Flavored Markdown
build_deps :
	 cmake
	 python
link_deps :
conflicts :
	 cmark
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "test"
	 system "make", "install"
