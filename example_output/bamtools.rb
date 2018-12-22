name :
	 Bamtools
homepage :
	 https://github.com/pezmaster31/bamtools
url :
	 https://github.com/pezmaster31/bamtools/archive/v2.5.1.tar.gz
description :
	 C++ API and command-line toolkit for BAM data
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
