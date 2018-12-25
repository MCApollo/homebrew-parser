name :
	 AvroCpp
homepage :
	 https://avro.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=avro/avro-1.8.2/cpp/avro-cpp-1.8.2.tar.gz
description :
	 Data serialization system
build_deps :
	 cmake
	 pkg-config
link_deps :
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
