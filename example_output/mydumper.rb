name :
	 Mydumper
homepage :
	 https://launchpad.net/mydumper
url :
	 https://launchpad.net/mydumper/0.9/0.9.1/+download/mydumper-0.9.1.tar.gz
description :
	 How MySQL DBA & support engineer would imagine 'mysqldump' ;-)
build_deps :
	 cmake
	 pkg-config
	 sphinx-doc
link_deps :
	 glib
	 mysql-client
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- cmake/modules/FindMySQL.cmake	2015-09-16 16:11:34.000000000 -0400
	 +++ cmake/modules/FindMySQL.cmake	2015-09-16 16:10:56.000000000 -0400
	 @@ -84,7 +84,7 @@
	 )
	 set(TMP_MYSQL_LIBRARIES "")
	 -set(CMAKE_FIND_LIBRARY_SUFFIXES .so .a .lib)
	 +set(CMAKE_FIND_LIBRARY_SUFFIXES .so .lib .dylib)
	 foreach(MY_LIB ${MYSQL_ADD_LIBRARIES})
	 find_library("MYSQL_LIBRARIES_${MY_LIB}" NAMES ${MY_LIB}
	 HINTS
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
