name :
	 Apngasm
homepage :
	 https://github.com/apngasm/apngasm
url :
	 https://github.com/apngasm/apngasm/archive/3.1.6.tar.gz
description :
	 Next generation of apngasm, the APNG assembler
build_deps :
	 cmake
link_deps :
	 boost
	 libpng
	 lzlib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "cli/CMakeLists.txt", "${CMAKE_INSTALL_PREFIX}/man/man1",
	 "${CMAKE_INSTALL_PREFIX}/share/man/man1"
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 (pkgshare/"test").install "test/samples"
