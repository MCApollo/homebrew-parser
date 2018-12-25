name :
	 Qjson
homepage :
	 https://qjson.sourceforge.io
url :
	 https://github.com/flavio/qjson/archive/0.9.0.tar.gz
description :
	 Map JSON to QVariant objects
build_deps :
	 cmake
link_deps :
	 qt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
