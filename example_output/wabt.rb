name :
	 Wabt
homepage :
	 https://github.com/WebAssembly/wabt
url :
	 https://github.com/WebAssembly/wabt/archive/1.0.6.tar.gz
description :
	 Web Assembly Binary Toolkit
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DBUILD_TESTS=OFF", *std_cmake_args
	 system "make", "install"
	 end
