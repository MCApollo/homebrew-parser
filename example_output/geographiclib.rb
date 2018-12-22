name :
	 Geographiclib
homepage :
	 https://geographiclib.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/geographiclib/distrib/GeographicLib-1.49.tar.gz
description :
	 C++ geography library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DCMAKE_OSX_SYSROOT=#{MacOS.sdk_path}", *std_cmake_args
	 system "make", "install"
	 end
