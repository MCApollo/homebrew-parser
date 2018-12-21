name :
	 Libphonenumber
homepage :
	 https://github.com/googlei18n/libphonenumber
url :
	 https://github.com/googlei18n/libphonenumber/archive/v8.10.2.tar.gz
description :
	 C++ Phone Number library by Google
build_deps :
	 cmake
link_deps :
	 boost
	 icu4c
	 :java
	 protobuf
	 re2
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 (buildpath/"gtest").install resource("gtest")
	 system "cmake", "cpp", "-DGTEST_SOURCE_DIR=gtest/googletest",
	 "-DGTEST_INCLUDE_DIR=gtest/googletest/include",
	 *std_cmake_args
	 system "make", "install"
