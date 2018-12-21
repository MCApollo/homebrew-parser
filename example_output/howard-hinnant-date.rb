name :
	 HowardHinnantDate
homepage :
	 https://github.com/HowardHinnant/date
url :
	 https://github.com/HowardHinnant/date/archive/v2.4.1.tar.gz
description :
	 C++ library for date and time operations based on <chrono>
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args,
	 "-DENABLE_DATE_TESTING=OFF",
	 "-DUSE_SYSTEM_TZ_DB=ON",
	 "-DBUILD_SHARED_LIBS=ON"
	 system "make", "install"
