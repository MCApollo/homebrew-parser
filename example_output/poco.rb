name :
	 Poco
homepage :
	 https://pocoproject.org/
url :
	 https://pocoproject.org/releases/poco-1.9.0/poco-1.9.0-all.tar.gz
description :
	 C++ class libraries for building network and internet-based applications
build_deps :
	 cmake
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args, "-DENABLE_DATA_MYSQL=OFF",
	 "-DENABLE_DATA_ODBC=OFF"
	 system "make", "install"
	 end
