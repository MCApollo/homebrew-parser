name :
	 Ldc
homepage :
	 https://wiki.dlang.org/LDC
url :
	 https://github.com/ldc-developers/ldc/releases/download/v1.12.0/ldc-1.12.0-src.tar.gz
description :
	 Portable D programming language compiler
build_deps :
	 cmake
	 libconfig
link_deps :
	 llvm
optional_deps :
conflicts :
resource :
	 ['ldc-bootstrap']
	 ['https://github.com/ldc-developers/ldc/releases/download/v1.12.0/ldc2-1.12.0-osx-x86_64.tar.xz']
patches :
EOF_patch :
install :
	 ENV.cxx11
	 (buildpath/"ldc-bootstrap").install resource("ldc-bootstrap")
	 mkdir "build" do
	 args = std_cmake_args + %W[
	 -DLLVM_ROOT_DIR=#{Formula["llvm"].opt_prefix}
	 -DINCLUDE_INSTALL_DIR=#{include}/dlang/ldc
	 -DD_COMPILER=#{buildpath}/ldc-bootstrap/bin/ldmd2
	 -DLDC_WITH_LLD=OFF
	 -DRT_ARCHIVE_WITH_LDC=OFF
	 ]
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 end
