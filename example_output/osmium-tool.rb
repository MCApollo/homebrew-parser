name :
	 OsmiumTool
homepage :
	 https://osmcode.org/osmium-tool/
url :
	 https://github.com/osmcode/osmium-tool/archive/v1.10.0.tar.gz
description :
	 Libosmium-based command-line tool for processing OpenStreetMap data
build_deps :
	 cmake
	 libosmium
link_deps :
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 protozero = Formula["libosmium"].opt_libexec/"include"
	 system "cmake", ".", "-DPROTOZERO_INCLUDE_DIR=#{protozero}", *std_cmake_args
	 system "make", "install"
