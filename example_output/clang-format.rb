name :
	 ClangFormat
homepage :
	 https://clang.llvm.org/docs/ClangFormat.html
url :
	 http://llvm.org/svn/llvm-project/llvm/tags/google/stable/2018-10-04/
description :
	 Formatting tools for C, C++, Obj-C, Java, JavaScript, TypeScript
build_deps :
	 cmake
	 ninja
	 subversion
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"projects/libcxx").install resource("libcxx")
	 (buildpath/"tools/clang").install resource("clang")
	 mkdir "build" do
	 args = std_cmake_args
	 args << "-DCMAKE_OSX_SYSROOT=/" unless MacOS::Xcode.installed?
	 args << "-DLLVM_ENABLE_LIBCXX=ON"
	 args << ".."
	 system "cmake", "-G", "Ninja", *args
	 system "ninja", "clang-format"
	 bin.install "bin/clang-format"
	 end
	 bin.install "tools/clang/tools/clang-format/git-clang-format"
	 (share/"clang").install Dir["tools/clang/tools/clang-format/clang-format*"]
