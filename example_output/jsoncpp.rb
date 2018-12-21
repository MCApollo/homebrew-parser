name :
	 Jsoncpp
homepage :
	 https://github.com/open-source-parsers/jsoncpp
url :
	 https://github.com/open-source-parsers/jsoncpp/archive/1.8.4.tar.gz
description :
	 Library for interacting with JSON
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args,
	 "-DBUILD_STATIC_LIBS=ON",
	 "-DBUILD_SHARED_LIBS=ON",
	 "-DJSONCPP_WITH_CMAKE_PACKAGE=ON",
	 "-DJSONCPP_WITH_TESTS=OFF",
	 "-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF",
	 "-DCCACHE_FOUND=CCACHE_FOUND-NOTFOUND"
	 system "make", "install"
