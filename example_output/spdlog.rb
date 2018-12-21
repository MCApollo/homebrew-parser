name :
	 Spdlog
homepage :
	 https://github.com/gabime/spdlog
url :
	 https://github.com/gabime/spdlog/archive/v1.2.1.tar.gz
description :
	 Super fast C++ logging library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 mkdir "spdlog-build" do
	 args = std_cmake_args
	 args << "-Dpkg_config_libdir=#{lib}" << ".."
	 system "cmake", *args
	 system "make", "install"
