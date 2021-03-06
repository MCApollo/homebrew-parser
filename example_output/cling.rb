name :
	 Cling
homepage :
	 https://root.cern.ch/cling
url :
	 https://github.com/root-project/cling.git
description :
	 The cling C++ interpreter
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 ['clang', 'llvm']
	 ['http://root.cern.ch/git/clang.git', 'http://root.cern.ch/git/llvm.git']
patches :
EOF_patch :
install :
	 (buildpath/"src").install resource("llvm")
	 (buildpath/"src/tools/cling").install buildpath.children - [buildpath/"src"]
	 (buildpath/"src/tools/clang").install resource("clang")
	 mkdir "build" do
	 system "cmake", *std_cmake_args, "../src",
	 "-DCMAKE_INSTALL_PREFIX=#{libexec}",
	 "-DCLING_CXX_PATH=clang++"
	 system "make", "install"
	 end
	 bin.install_symlink libexec/"bin/cling"
	 prefix.install_metafiles buildpath/"src/tools/cling"
