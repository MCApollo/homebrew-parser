name :
	 Libstxxl
homepage :
	 https://stxxl.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/stxxl/stxxl/1.4.1/stxxl-1.4.1.tar.gz
description :
	 C++ implementation of STL for extra large data sets
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args - %w[-DCMAKE_BUILD_TYPE=None]
	 args << "-DCMAKE_BUILD_TYPE=Release"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 end
