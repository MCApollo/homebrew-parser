name :
	 MongoCxxDriver
homepage :
	 https://github.com/mongodb/mongo-cxx-driver
url :
	 https://github.com/mongodb/mongo-cxx-driver/archive/r3.4.0.tar.gz
description :
	 C++ driver for MongoDB
build_deps :
	 cmake
link_deps :
	 mongo-c-driver
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mongo_c_prefix = Formula["mongo-c-driver"].opt_prefix
	 system "cmake", ".", *std_cmake_args,
	 "-DLIBBSON_DIR=#{mongo_c_prefix}", "-DLIBMONGOC_DIR=#{mongo_c_prefix}"
	 system "make"
	 system "make", "install"
	 pkgshare.install "examples"
