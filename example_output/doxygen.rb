name :
	 Doxygen
homepage :
	 http://www.doxygen.org/
url :
	 https://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.14.src.tar.gz
description :
	 Generate documentation for several programming languages
build_deps :
	 cmake
link_deps :
	 graphviz
	 llvm
	 qt
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args << "-DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=#{MacOS.version}"
	 args << "-Dbuild_wizard=ON" if build.with? "qt"
	 args << "-Duse_libclang=ON -DLLVM_CONFIG=#{Formula["llvm"].opt_bin}/llvm-config" if build.with? "llvm"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 end
	 bin.install Dir["build/bin/*"]
	 man1.install Dir["doc/*.1"]
