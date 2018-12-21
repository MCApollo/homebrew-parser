name :
	 Ponyc
homepage :
	 https://www.ponylang.org/
url :
	 https://github.com/ponylang/ponyc/archive/0.25.0.tar.gz
description :
	 Object-oriented, actor-model, capabilities-secure programming language
build_deps :
link_deps :
	 libressl
	 llvm@3.9
	 :macos
	 pcre2
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV["LLVM_CONFIG"] = "#{Formula["llvm@3.9"].opt_bin}/llvm-config"
	 system "make", "install", "verbose=1", "config=release",
	 "ponydir=#{prefix}", "prefix="
