name :
	 Stormlib
homepage :
	 http://www.zezula.net/en/mpq/stormlib.html
url :
	 https://github.com/ladislav-zezula/StormLib/archive/v9.22.tar.gz
description :
	 Library for handling Blizzard MPQ archives
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
	 diff --git a/CMakeLists.txt b/CMakeLists.txt
	 index 76c6aa9..4fd0a46 100644
	 --- a/CMakeLists.txt
	 +++ b/CMakeLists.txt
	 @@ -297,7 +297,6 @@ target_include_directories(${LIBRARY_NAME} PUBLIC src/)
	 set_target_properties(${LIBRARY_NAME} PROPERTIES PUBLIC_HEADER "src/StormLib.h;src/StormPort.h")
	 if(BUILD_SHARED_LIBS)
	 if(APPLE)
	 -        set_target_properties(${LIBRARY_NAME} PROPERTIES FRAMEWORK true)
	 set_target_properties(${LIBRARY_NAME} PROPERTIES LINK_FLAGS "-framework Carbon")
	 endif()
	 if(UNIX)
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 system "cmake", ".", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
	 system "make", "install"
