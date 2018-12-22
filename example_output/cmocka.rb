name :
	 Cmocka
homepage :
	 https://cmocka.org/
url :
	 https://cmocka.org/files/1.1/cmocka-1.1.3.tar.xz
description :
	 Unit testing framework for C
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DWITH_STATIC_LIB=ON" << "-DWITH_CMOCKERY_SUPPORT=ON" << "-DUNIT_TESTING=ON"
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 args << "-DHAVE_CLOCK_GETTIME:INTERNAL=0"
	 end
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 end
