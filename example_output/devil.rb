name :
	 Devil
homepage :
	 https://sourceforge.net/projects/openil/
url :
description :
	 Cross-platform image library
build_deps :
	 cmake
link_deps :
	 jasper
	 jpeg
	 libpng
	 libtiff
	 little-cms2
conflicts :
patches :
	 https://github.com/DentonW/DevIL/commit/4a2d7822.patch?full_index=1
EOF_patch :
install :
	 cd "DevIL" do
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
