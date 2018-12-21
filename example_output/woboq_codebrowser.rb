name :
	 WoboqCodebrowser
homepage :
	 https://code.woboq.org/
url :
	 https://github.com/woboq/woboq_codebrowser/archive/2.1.tar.gz
description :
	 Generate HTML from C++ Code
build_deps :
	 cmake
link_deps :
	 llvm
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 -DLLVM_CONFIG_EXECUTABLE=#{Formula["llvm"].opt_bin}/llvm-config
	 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
	 ]
	 system "cmake", ".", *args
	 system "make"
	 bin.install "indexgenerator/codebrowser_indexgenerator",
	 "generator/codebrowser_generator"
	 prefix.install "data"
