name :
	 Metashell
homepage :
	 http://metashell.org
url :
	 https://github.com/metashell/metashell/archive/v4.0.0.tar.gz
description :
	 Metaprogramming shell for C++ templates
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 mkdir "3rd/templight/build" do
	 system "cmake", "../llvm", "-DLLVM_ENABLE_TERMINFO=OFF", *std_cmake_args
	 system "make", "templight"
	 end
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
