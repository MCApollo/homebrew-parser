name :
	 ColladaDom
homepage :
	 https://www.khronos.org/collada/wiki/Portal:COLLADA_DOM
url :
description :
	 C++ library for loading and saving COLLADA data
build_deps :
	 cmake
link_deps :
	 boost
	 pcre
conflicts :
patches :
EOF_patch :
	 diff --git a/CMakeLists.txt b/CMakeLists.txt
	 index 72b6deb..0c7f7ce 100644
	 --- a/CMakeLists.txt
	 +++ b/CMakeLists.txt
	 @@ -100,7 +100,7 @@ endif()
	 if( APPLE OR ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
	 -  add_definitions("-Dfopen64=fopen -Dfseeko64=fseeko -Dfseek64=fseek -Dftell64=ftell -Dftello64=ftello")
	 +  add_definitions(-Dfopen64=fopen -Dfseeko64=fseeko -Dfseek64=fseek -Dftell64=ftell -Dftello64=ftello)
	 set(COLLADA_DOM_INCLUDE_INSTALL_DIR "include/collada-dom")
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
