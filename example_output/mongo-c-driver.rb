name :
	 MongoCDriver
homepage :
	 https://github.com/mongodb/mongo-c-driver
url :
	 https://github.com/mongodb/mongo-c-driver/releases/download/1.13.0/mongo-c-driver-1.13.0.tar.gz
description :
	 C driver for MongoDB
build_deps :
	 cmake
	 pkg-config
	 sphinx-doc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 (pkgshare/"libbson").install "src/libbson/examples"
	 (pkgshare/"libmongoc").install "src/libmongoc/examples"
