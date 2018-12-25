name :
	 FluentBit
homepage :
	 https://github.com/fluent/fluent-bit
url :
	 https://github.com/fluent/fluent-bit/archive/v0.14.9.tar.gz
description :
	 Data Collector for IoT
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
	 mbedtls
	 msgpack
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 system "cmake", ".", "-DWITH_IN_MEM=OFF", *std_cmake_args
	 system "make", "install"
