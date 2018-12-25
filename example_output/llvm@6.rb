name :
	 LlvmAT6
homepage :
	 https://llvm.org/
url :
	 https://releases.llvm.org/6.0.1/llvm-6.0.1.src.tar.xz
description :
	 Next-gen compiler infrastructure
build_deps :
	 cmake
link_deps :
	 libffi
	 python@2
optional_deps :
conflicts :
resource :
	 ['clang', 'clang-extra-tools', 'compiler-rt', 'libcxx', 'libunwind', 'lld', 'lldb', 'openmp', 'polly']
	 ['https://releases.llvm.org/6.0.1/cfe-6.0.1.src.tar.xz', 'https://releases.llvm.org/6.0.1/clang-tools-extra-6.0.1.src.tar.xz', 'https://releases.llvm.org/6.0.1/compiler-rt-6.0.1.src.tar.xz', 'https://releases.llvm.org/6.0.1/libcxx-6.0.1.src.tar.xz', 'https://releases.llvm.org/6.0.1/libunwind-6.0.1.src.tar.xz', 'https://releases.llvm.org/6.0.1/lld-6.0.1.src.tar.xz', 'https://releases.llvm.org/6.0.1/lldb-6.0.1.src.tar.xz', 'https://releases.llvm.org/6.0.1/openmp-6.0.1.src.tar.xz', 'https://releases.llvm.org/6.0.1/polly-6.0.1.src.tar.xz']
patches :
EOF_patch :
install :
	 ENV.libcxx if ENV.compiler == :clang
	 (buildpath/"tools/clang").install resource("clang")
	 (buildpath/"tools/clang/tools/extra").install resource("clang-extra-tools")
	 (buildpath/"projects/openmp").install resource("openmp")
	 (buildpath/"projects/libcxx").install resource("libcxx")
	 (buildpath/"projects/libunwind").install resource("libunwind")
	 (buildpath/"tools/lld").install resource("lld")
	 (buildpath/"tools/polly").install resource("polly")
	 (buildpath/"projects/compiler-rt").install resource("compiler-rt")
	 ENV.permit_arch_flags
	 args = %W[
	 -DLIBOMP_ARCH=x86_64
	 -DLINK_POLLY_INTO_TOOLS=ON
	 -DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON
	 -DLLVM_BUILD_LLVM_DYLIB=ON
	 -DLLVM_ENABLE_EH=ON
	 -DLLVM_ENABLE_FFI=ON
	 -DLLVM_ENABLE_LIBCXX=ON
	 -DLLVM_ENABLE_RTTI=ON
	 -DLLVM_INCLUDE_DOCS=OFF
	 -DLLVM_INSTALL_UTILS=ON
	 -DLLVM_OPTIMIZED_TABLEGEN=ON
	 -DLLVM_TARGETS_TO_BUILD=all
	 -DWITH_POLLY=ON
	 -DFFI_INCLUDE_DIR=#{Formula["libffi"].opt_lib}/libffi-#{Formula["libffi"].version}/include
	 -DFFI_LIBRARY_DIR=#{Formula["libffi"].opt_lib}
	 -DLLVM_CREATE_XCODE_TOOLCHAIN=ON
	 ]
	 mkdir "build" do
	 system "cmake", "-G", "Unix Makefiles", "..", *(std_cmake_args + args)
	 system "make"
	 system "make", "install"
	 system "make", "install-xcode-toolchain"
	 end
	 (share/"clang/tools").install Dir["tools/clang/tools/scan-{build,view}"]
	 (share/"cmake").install "cmake/modules"
	 inreplace "#{share}/clang/tools/scan-build/bin/scan-build", "$RealBin/bin/clang", "#{bin}/clang"
	 bin.install_symlink share/"clang/tools/scan-build/bin/scan-build", share/"clang/tools/scan-view/bin/scan-view"
	 man1.install_symlink share/"clang/tools/scan-build/man/scan-build.1"
	 (lib/"python2.7/site-packages").install buildpath/"bindings/python/llvm"
	 (lib/"python2.7/site-packages").install buildpath/"tools/clang/bindings/python/clang"
