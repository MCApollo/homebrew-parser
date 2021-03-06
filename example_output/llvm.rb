name :
	 Llvm
homepage :
	 https://llvm.org/
url :
	 https://releases.llvm.org/7.0.0/llvm-7.0.0.src.tar.xz
description :
	 Next-gen compiler infrastructure
build_deps :
	 cmake
link_deps :
	 libffi
	 python@2
	 swig
	 :codesign
optional_deps :
conflicts :
resource :
	 ['clang', 'clang-extra-tools', 'compiler-rt', 'libcxx', 'libunwind', 'lld', 'lldb', 'openmp', 'polly', 'clang-extra-tools', 'compiler-rt', 'libcxx', 'libunwind', 'lld', 'lldb', 'openmp', 'polly']
	 ['https://releases.llvm.org/7.0.0/cfe-7.0.0.src.tar.xz', 'https://releases.llvm.org/7.0.0/clang-tools-extra-7.0.0.src.tar.xz', 'https://releases.llvm.org/7.0.0/compiler-rt-7.0.0.src.tar.xz', 'https://releases.llvm.org/7.0.0/libcxx-7.0.0.src.tar.xz', 'https://releases.llvm.org/7.0.0/libunwind-7.0.0.src.tar.xz', 'https://releases.llvm.org/7.0.0/lld-7.0.0.src.tar.xz', 'https://releases.llvm.org/7.0.0/lldb-7.0.0.src.tar.xz', 'https://releases.llvm.org/7.0.0/openmp-7.0.0.src.tar.xz', 'https://releases.llvm.org/7.0.0/polly-7.0.0.src.tar.xz', 'https://git.llvm.org/git/clang-tools-extra.git', 'https://git.llvm.org/git/compiler-rt.git', 'https://git.llvm.org/git/libcxx.git', 'https://git.llvm.org/git/libunwind.git', 'https://git.llvm.org/git/lld.git', 'https://git.llvm.org/git/lldb.git', 'https://git.llvm.org/git/openmp.git', 'https://git.llvm.org/git/polly.git']
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
	 if build.with? "lldb"
	 (buildpath/"tools/lldb").install resource("lldb")
	 mkdir_p "#{ENV["HOME"]}/Library/Preferences"
	 username = ENV["USER"]
	 system "security", "list-keychains", "-d", "user", "-s", "/Users/#{username}/Library/Keychains/login.keychain"
	 end
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
