name :
	 Clingo
homepage :
	 https://potassco.org/
url :
	 https://github.com/potassco/clingo/archive/v5.3.0.tar.gz
description :
	 ASP system to ground and solve logic programs
build_deps :
	 cmake
	 doxygen
link_deps :
	 lua
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DCLINGO_BUILD_WITH_PYTHON=ON",
	 "-DCLINGO_BUILD_PY_SHARED=ON",
	 "-DPYCLINGO_USE_INSTALL_PREFIX=ON",
	 "-DCLINGO_BUILD_WITH_LUA=ON",
	 "-DPYTHON_EXECUTABLE=#{Formula["python"].opt_bin}/python3",
	 "-DPYCLINGO_DYNAMIC_LOOKUP=OFF",
	 *std_cmake_args
	 system "make", "install"
