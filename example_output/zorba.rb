name :
	 Zorba
homepage :
	 http://www.zorba.io/
url :
	 https://github.com/28msec/zorba/archive/3.1.tar.gz
description :
	 NoSQL query processor
build_deps :
	 cmake
link_deps :
	 flex
	 icu4c
	 :macos
	 xerces-c
conflicts :
	 xqilla
patches :
EOF_patch :
install :
	 ENV.append "CXXFLAGS", "-DU_USING_ICU_NAMESPACE=1"
	 ENV.cxx11
	 args = std_cmake_args
	 if MacOS.version == :el_capitan && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 args << "-DZORBA_HAVE_CLOCKGETTIME=OFF"
