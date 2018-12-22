name :
	 Emscripten
homepage :
	 https://kripken.github.io/emscripten-site/
url :
	 https://github.com/kripken/emscripten/archive/1.38.20.tar.gz
description :
	 LLVM bytecode to JavaScript compiler
build_deps :
	 cmake
link_deps :
	 node
	 python@2
	 yuicompressor
	 closure-compiler
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 python2_shebangs = `grep --recursive --files-with-matches ^#!/usr/bin/python #{buildpath}`
	 python2_shebang_files = python2_shebangs.lines.sort.uniq
	 python2_shebang_files.map! { |f| Pathname(f.chomp) }
	 python2_shebang_files.reject! &:symlink?
	 inreplace python2_shebang_files, %r{^#!/usr/bin/python2?$}, "#!#{Formula["python@2"].opt_bin}/python2"
	 libexec.install Dir["*"]
	 (buildpath/"fastcomp").install resource("fastcomp")
	 (buildpath/"fastcomp/tools/clang").install resource("fastcomp-clang")
	 cmake_args = std_cmake_args.reject { |s| s["CMAKE_INSTALL_PREFIX"] }
	 cmake_args = [
	 "-DCMAKE_BUILD_TYPE=Release",
	 "-DCMAKE_INSTALL_PREFIX=#{libexec}/llvm",
	 "-DLLVM_TARGETS_TO_BUILD='X86;JSBackend'",
	 "-DLLVM_INCLUDE_EXAMPLES=OFF",
	 "-DLLVM_INCLUDE_TESTS=OFF",
	 "-DCLANG_INCLUDE_TESTS=OFF",
	 "-DOCAMLFIND=/usr/bin/false",
	 "-DGO_EXECUTABLE=/usr/bin/false",
	 ]
	 mkdir "fastcomp/build" do
	 system "cmake", "..", *cmake_args
	 system "make"
	 system "make", "install"
	 end
	 %w[em++ em-config emar emcc emcmake emconfigure emlink.py emmake
	 emranlib emrun emscons].each do |emscript|
	 bin.install_symlink libexec/emscript
	 end
