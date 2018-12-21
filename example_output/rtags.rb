name :
	 Rtags
homepage :
	 https://github.com/Andersbakken/rtags
url :
	 https://github.com/Andersbakken/rtags.git
description :
	 Source code cross-referencer like ctags with a clang frontend
build_deps :
	 cmake
link_deps :
	 emacs
	 llvm
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.append("LDFLAGS", "-lc++abi")
	 args = std_cmake_args << "-DRTAGS_NO_BUILD_CLANG=ON"
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 args << "-DHAVE_CLOCK_MONOTONIC_RAW:INTERNAL=0"
	 args << "-DHAVE_CLOCK_MONOTONIC:INTERNAL=0"
