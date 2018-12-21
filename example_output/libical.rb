name :
	 Libical
homepage :
	 https://libical.github.io/libical/
url :
	 https://github.com/libical/libical/releases/download/v3.0.4/libical-3.0.4.tar.gz
description :
	 Implementation of iCalendar protocols and data formats
build_deps :
	 cmake
	 pkg-config
link_deps :
	 glib
	 icu4c
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DBDB_LIBRARY=BDB_LIBRARY-NOTFOUND",
	 "-DSHARED_ONLY=ON",
	 *std_cmake_args
	 system "make", "install"
