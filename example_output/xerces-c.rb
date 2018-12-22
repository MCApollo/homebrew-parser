name :
	 XercesC
homepage :
	 https://xerces.apache.org/xerces-c/
url :
	 https://www.apache.org/dyn/closer.cgi?path=xerces/c/3/sources/xerces-c-3.2.2.tar.gz
description :
	 Validating XML parser
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "ctest", "-V"
	 system "make", "install"
	 end
	 (bin/"MemParse").unlink
