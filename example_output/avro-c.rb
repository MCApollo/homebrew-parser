name :
	 AvroC
homepage :
	 https://avro.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=avro/avro-1.8.2/c/avro-c-1.8.2.tar.gz
description :
	 Data serialization system
build_deps :
	 cmake
	 pkg-config
link_deps :
	 jansson
	 snappy
	 xz
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
	 pkgshare.install "tests/test_avro_1087"
