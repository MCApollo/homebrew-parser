name :
	 Neko
homepage :
	 https://nekovm.org/
url :
	 https://github.com/HaxeFoundation/neko/archive/v2-2-0/neko-2.2.0.tar.gz
description :
	 High-level, dynamically typed programming language
build_deps :
	 cmake
	 ninja
	 pkg-config
link_deps :
	 bdw-gc
	 mbedtls
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", "-G", "Ninja", "-DSTATIC_DEPS=MariaDBConnector",
	 "-DRELOCATABLE=OFF", "-DRUN_LDCONFIG=OFF", *std_cmake_args
	 system "ninja", "install"
