name :
	 Zint
homepage :
	 http://www.zint.org.uk/
url :
	 https://downloads.sourceforge.net/project/zint/zint/2.6.3/zint-2.6.3.src.tar.gz
description :
	 Barcode encoding library supporting over 50 symbologies
build_deps :
	 cmake
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 inreplace "CMakeLists.txt", "${CMAKE_ROOT}", "#{share}/cmake"
	 mkdir "zint-build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
