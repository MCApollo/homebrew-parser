name :
	 Crystal
homepage :
	 https://crystal-lang.org/
url :
	 https://github.com/crystal-lang/crystal/archive/0.27.0.tar.gz
description :
	 Fast and statically typed, compiled language with Ruby-like syntax
build_deps :
	 libatomic_ops
	 pkg-config
link_deps :
	 bdw-gc
	 gmp
	 libevent
	 libyaml
	 llvm@6
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"boot").install resource("boot")
	 if build.head?
	 ENV["CRYSTAL_CONFIG_BUILD_COMMIT"] = Utils.popen_read("git rev-parse --short HEAD").strip
