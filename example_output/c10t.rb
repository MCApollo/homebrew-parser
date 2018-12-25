name :
	 C10t
homepage :
	 https://github.com/udoprog/c10t
url :
	 https://github.com/udoprog/c10t/archive/1.7.tar.gz
description :
	 Minecraft cartography tool
build_deps :
	 cmake
link_deps :
	 boost
	 freetype
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/udoprog/c10t/commit/4a392b9f06d08c70290f4c7591e84ecdbc73d902.diff?full_index=1
	 https://gist.githubusercontent.com/mistydemeo/f7ab02089c43dd557ef4/raw/a0ae7974e635b8ebfd02e314cfca9aa8dc95029d/c10t-freetype.diff
	 https://github.com/udoprog/c10t/commit/800977bb23e6b4f9da3ac850ac15dd216ece0cda.diff?full_index=1
EOF_patch :
install :
	 inreplace "test/CMakeLists.txt", "boost_unit_test_framework", "boost_unit_test_framework-mt"
	 system "cmake", ".", *std_cmake_args
	 system "make"
	 bin.install "c10t"
