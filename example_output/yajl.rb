name :
	 Yajl
homepage :
	 https://lloyd.github.io/yajl/
url :
	 https://github.com/lloyd/yajl/archive/2.1.0.tar.gz
description :
	 Yet Another JSON Library
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 (include/"yajl").install Dir["src/api/*.h"]
