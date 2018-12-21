name :
	 Chaiscript
homepage :
	 https://chaiscript.com/
url :
	 https://github.com/ChaiScript/ChaiScript/archive/v6.1.0.tar.gz
description :
	 Easy to use embedded scripting language for C++
build_deps :
	 cmake
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
