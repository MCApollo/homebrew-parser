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
conflicts :
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
