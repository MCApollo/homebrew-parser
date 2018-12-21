name :
	 Castxml
homepage :
	 https://github.com/CastXML/CastXML
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/c/castxml/castxml_0.1+git20180702.orig.tar.xz
description :
	 C-family Abstract Syntax Tree XML Output
build_deps :
	 cmake
link_deps :
	 llvm
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
